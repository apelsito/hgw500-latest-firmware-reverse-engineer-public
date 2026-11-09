// SPDX-License-Identifier: GPL-2.0-only
/* HGW500 Topaz non-alias register map; see vendor GPL ruby/machine.c.
 * MMIO mappings are established at boot, never allocated in atomic restart.
 * Quiescing drivers and syncing filesystems belong to earlier shutdown stages.
 */
#include <linux/delay.h>
#include <linux/init.h>
#include <linux/io.h>
#include <linux/kobject.h>
#include <linux/notifier.h>
#include <linux/reboot.h>
#include <linux/sysfs.h>
#include <asm/mach_desc.h>

#define TOPAZ_SYSCTL_BASE 0xe0000000
#define TOPAZ_WDT_BASE 0xf4000000
#define TOPAZ_CPU_VEC_MASK 0x00
#define TOPAZ_CPU_VEC 0x04
#define TOPAZ_WDT_CTL 0x00
#define TOPAZ_WDT_TIMEOUT 0x04
#define TOPAZ_WDT_RESTART 0x0c
#define TOPAZ_WDT_ENABLE 0x01
#define TOPAZ_WDT_RESET_TIMEOUT 0x08
#define TOPAZ_WDT_MAGIC 0x76

static void __iomem *topaz_sysctl;
static void __iomem *topaz_wdt;

static int topaz_restart(struct notifier_block *nb, unsigned long mode, void *cmd)
{
	/* Same global-reset mask and watchdog sequence as Quantenna's BSP.
	 * Do not flush caches after resetting DDR or touch bootenv/SPI here.
	 */
	writel(TOPAZ_WDT_ENABLE, topaz_wdt + TOPAZ_WDT_CTL);
	writel(TOPAZ_WDT_RESET_TIMEOUT, topaz_wdt + TOPAZ_WDT_TIMEOUT);
	writel(TOPAZ_WDT_MAGIC, topaz_wdt + TOPAZ_WDT_RESTART);
	readl(topaz_wdt + TOPAZ_WDT_CTL);
	writel(~0U, topaz_sysctl + TOPAZ_CPU_VEC_MASK);
	writel(0, topaz_sysctl + TOPAZ_CPU_VEC);
	writel(0, topaz_sysctl + TOPAZ_CPU_VEC_MASK);
	readl(topaz_sysctl + TOPAZ_CPU_VEC_MASK);
	mdelay(1000);
	pr_emerg("Topaz: global reset returned; watchdog fallback armed\n");
	return NOTIFY_DONE;
}

static struct notifier_block topaz_restart_nb = {
	.notifier_call = topaz_restart,
	.priority = 128,
};

static ssize_t hgw500_restart_handler_show(struct kobject *kobj,
					 struct kobj_attribute *attr, char *buf)
{
	return sysfs_emit(buf, "topaz-global-reset-v1\n");
}
static struct kobj_attribute hgw500_restart_handler_attr =
	__ATTR_RO(hgw500_restart_handler);

static void __init topaz_init_machine(void)
{
	int ret;

	topaz_sysctl = ioremap(TOPAZ_SYSCTL_BASE, 0x08);
	topaz_wdt = ioremap(TOPAZ_WDT_BASE, 0x10);
	if (!topaz_sysctl || !topaz_wdt) {
		pr_err("Topaz: restart MMIO mapping failed\n");
		goto unmap;
	}
	ret = register_restart_handler(&topaz_restart_nb);
	if (ret) {
		pr_err("Topaz: restart registration failed: %d\n", ret);
		goto unmap;
	}
	ret = sysfs_create_file(kernel_kobj, &hgw500_restart_handler_attr.attr);
	if (ret) {
		unregister_restart_handler(&topaz_restart_nb);
		pr_err("Topaz: restart readiness publication failed: %d\n", ret);
		goto unmap;
	}
	pr_info("Topaz: global reset and watchdog restart handler registered\n");
	return;
unmap:
	if (topaz_wdt)
		iounmap(topaz_wdt);
	if (topaz_sysctl)
		iounmap(topaz_sysctl);
}

static const char *topaz_basic_compat[] __initconst = {
	"openmitrastar,hgw500-topaz-basic",
	NULL,
};

MACHINE_START(TOPAZ_BASIC, "OpenMitraStar Topaz HGW500")
	.dt_compat = topaz_basic_compat,
	.init_machine = topaz_init_machine,
MACHINE_END
