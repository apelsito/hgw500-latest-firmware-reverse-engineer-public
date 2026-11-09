#!/usr/bin/env python3
"""Derive the core PID1 from pinned R2 radio parameters, without changing originals."""
import argparse
from pathlib import Path

LIFECYCLE = r'''
/* ARC uses the generic Linux syscall ABI; keep signals blocked and consume
 * them through signalfd. Explicit dispositions allow PID1 to receive them.
 * No async signal handler performs I/O or shutdown work.
 */
static long signal_fd = -1;
static int shutdown_pending;
static const u32 shutdown_mask[2] = {(1U << (15-1)) | (1U << (2-1)), 0};
static void unused_signal_handler(int signal) { (void)signal; }
static int setup_shutdown_signals(void) {
 struct { word handler, flags, restorer; u32 mask[2]; } action;
 zero(&action, sizeof(action)); action.handler=(word)unused_signal_handler;
 if(call5(135,0,(long)shutdown_mask,0,8,0)<0)return -1;
 if(call5(134,15,(long)&action,0,8,0)<0 ||
    call5(134,2,(long)&action,0,8,0)<0)return -1;
 signal_fd=call5(74,-1,(long)shutdown_mask,8,0x80800,0);
 return signal_fd<0 ? -1 : 0;
}
static int console_ready(void) {
 struct { int fd; short events, revents; } fds[2]={{0,1,0},{signal_fd,1,0}};
 struct { long long seconds,nanos; } timeout={0,100000000};
 long result=call5(414,(long)fds,2,(long)&timeout,0,8);
 if(result<0)return 0;
 if(fds[1].revents & 1) {
  u32 info[32];long got=call5(63,signal_fd,(long)info,sizeof(info),0,0);
  if(got==(long)sizeof(info) && (info[0]==15 || info[0]==2))shutdown_pending=1;
 }
 return !!(fds[0].revents & 1);
}
static void orderly_restart(void) {
 char marker[32];
 long fd=call5(56,AT_FDCWD,(long)"/sys/kernel/hgw500_restart_handler",0,0,0);
 long got=fd<0 ? -1 : call5(63,fd,(long)marker,sizeof(marker)-1,0,0);
 if(fd>=0)call5(57,fd,0,0,0,0);
 if(got<=0){say("OM_RESTART_REFUSED_NO_HANDLER\n");return;}
 marker[got]=0;
 if(!eq(marker,"topaz-global-reset-v1\n")){say("OM_RESTART_REFUSED_HANDLER\n");return;}
 say("OM_SHUTDOWN_SERVICES\n");
 /* PID1 is excluded by kill(-1). Children and their descendants get TERM
  * before KILL; no userspace writer remains when preparation syncs storage.
  */
 call5(129,-1,15,0,0,0);
 for(unsigned i=0;i<20;i++){pause_ms(100);reap();}
 call5(129,-1,9,0,0,0);pause_ms(100);reap();
 const char *const args[]={"/bin/sh","/usr/libexec/openmitrastar/om-shutdown","prepare",0};
 if(child(args,0)){say("OM_RESTART_REFUSED_PREPARE_FAILED\n");return;}
 call5(81,0,0,0,0,0); /* sync(2), then the normal kernel device/syscore path */
 say("OM_RESTART_KERNEL\n");
 long result=call5(142,0xfee1dead,0x28121969,0x1234567,0,0);
 report("OM_RESTART_RETURNED",result);
}
'''

AUTOSTART = r'''
static void autostart(void) {
 say("OM_BOOT_CORE_BEGIN\n");
 load_driver();
 if(!loaded){say("OM_BOOT_ETH_FAILURE\n");return;}
 const char *const wired[]={"/bin/sh","/usr/libexec/openmitrastar/om-boot-network","wired",0};
 if(child(wired,0)){say("OM_BOOT_WIRED_FAILURE\n");return;}
 const char *const upstream[]={"/bin/busybox","udhcpc","-f","-i","br0","-p","/run/om-upstream-dhcp.pid",
  "-s","/usr/libexec/openmitrastar/om-upstream-dhcp","-x","hostname:hgw500","-t","3","-T","2",0};
 child(upstream,1);
 ssh_start();https_start();
 load_radio();radio_country();
 if(radio_loaded==sizeof(radio_modules)/sizeof(radio_modules[0])) {
  const char *const wifi[]={"/bin/sh","/usr/libexec/openmitrastar/om-boot-network","wifi",0};
  if(!child(wifi,0))radio_ap();
 }
 /* Optional static assets never delay management networking. No game process
  * is started by core boot. It may be enabled separately after acceptance.
  */
 const char *const assets[]={"/bin/busybox","timeout","15","/usr/sbin/om73-assets-mount",0};
 child(assets,1);
 const char *const hardware[]={"/bin/sh","/usr/libexec/openmitrastar/om-boot-network","leds",0};
 child(hardware,1);
 say("OM_BOOT_CORE_READY\n");
}
'''


def replace_once(text, old, new):
    if text.count(old) != 1:
        raise ValueError("PID1 source anchor drift: " + old[:80])
    return text.replace(old, new)


def generate(source):
    text = source.read_text()
    start = text.index("static int port_carrier(")
    end = text.index("static volatile u32 ram[", start)
    text = text[:start] + LIFECYCLE + AUTOSTART + text[end:]
    # Unblock in every child before exec; close-on-exec protects signalfd.
    text = replace_once(text, "if(pid==0){call5(221,", "if(pid==0){call5(135,1,(long)shutdown_mask,0,8,0);call5(221,")
    # Child helper appears before lifecycle definitions.
    text = replace_once(text, "static const char *const environment[]=", "static const u32 shutdown_mask[2];\nstatic const char *const environment[]=")
    text = replace_once(text, 'say("OPENMITRASTAR_RADIOETH73_DOOMOPEN_R2\\n");', 'say("OPENMITRASTAR_BOOT_CORE_R1\\n");')
    text = replace_once(text, 'char line[48],c;word n=0;', 'if(call5(172,0,0,0,0,0)!=1){say("OM_PID1_REQUIRED\\n");call5(93,2,0,0,0,0);for(;;){}}char line[48],c;word n=0;')
    text = replace_once(text, 'cat("/proc/sys/kernel/osrelease");autostart();', 'cat("/proc/sys/kernel/osrelease");if(setup_shutdown_signals()){say("OM_SIGNAL_SETUP_FAILED\\n");for(;;)pause_ms(1000);}autostart();')
    text = replace_once(text, 'for(;;){reap();long r=call5(63,0,', 'for(;;){reap();if(shutdown_pending){shutdown_pending=0;orderly_restart();say("eth73> ");}if(!console_ready())continue;long r=call5(63,0,')
    text = replace_once(text, 'else if(eq(line,"reboot")){say("ETH73_REBOOT_REQUESTED\\n");call5(142,0xfee1dead,0x28121969,0x1234567,0,0);}', 'else if(eq(line,"reboot")){shutdown_pending=1;}')
    return text


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--source', type=Path, default=Path(__file__).resolve().parents[1] / 'sources/product/init-autostart2g.c')
    p.add_argument('--output', type=Path, required=True)
    args = p.parse_args()
    if args.output.exists():
        p.error('Choose an absent generated source')
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(generate(args.source), newline='\n')


if __name__ == '__main__':
    main()
