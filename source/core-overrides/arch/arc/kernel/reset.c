// SPDX-License-Identifier: GPL-2.0-only
/*
 * Copyright (C) 2011-2012 Synopsys, Inc. (www.synopsys.com)
 * ARC restart-chain integration for the HGW500 kernel overlay.
 */
#include <linux/kernel.h>
#include <linux/printk.h>
#include <linux/reboot.h>
#include <linux/pm.h>
#include <linux/irqflags.h>

void machine_halt(void)
{
	__asm__ __volatile__("flag  1\n");
}

void machine_restart(char *cmd)
{
	/* kernel_restart() has already run device and syscore shutdown. */
	local_irq_disable();
	do_kernel_restart(cmd);
	pr_emerg("ARC: restart handlers returned; halting\n");
	machine_halt();
}

void machine_power_off(void)
{
	machine_halt();
}

void (*pm_power_off)(void) = NULL;
EXPORT_SYMBOL(pm_power_off);
