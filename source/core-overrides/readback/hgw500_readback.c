// SPDX-License-Identifier: GPL-2.0-only
/* Read-only view of the HGW500 CPU-mapped SPI window. No writer or ioctl.
 * Physical map: vendor ruby_spi_api.h and live arcade-assets DT resource.
 * Local diagnostic module, never part of the normal firmware.
 */
#include <linux/capability.h>
#include <linux/fs.h>
#include <linux/io.h>
#include <linux/miscdevice.h>
#include <linux/module.h>
#include <linux/of.h>
#include <linux/slab.h>
#include <linux/uaccess.h>

#define FLASH_BASE 0x90000000
#define FLASH_BYTES 0x01000000
static void __iomem *flash;

static int rb_open(struct inode *inode, struct file *file)
{
	return capable(CAP_SYS_RAWIO) ? 0 : -EPERM;
}

static ssize_t rb_read(struct file *file, char __user *out, size_t size, loff_t *pos)
{
	void *buffer;

	if (*pos < 0)
		return -EINVAL;
	if (*pos >= FLASH_BYTES)
		return 0;
	size = min_t(size_t, size, min_t(loff_t, PAGE_SIZE, FLASH_BYTES - *pos));
	if (!size)
		return 0;
	buffer = kmalloc(size, GFP_KERNEL);
	if (!buffer)
		return -ENOMEM;
	memcpy_fromio(buffer, flash + *pos, size);
	if (copy_to_user(out, buffer, size)) {
		kfree(buffer);
		return -EFAULT;
	}
	kfree(buffer);
	*pos += size;
	return size;
}

static loff_t rb_seek(struct file *file, loff_t off, int whence)
{
	return fixed_size_llseek(file, off, whence, FLASH_BYTES);
}

static const struct file_operations rb_ops = {
	.owner = THIS_MODULE,
	.open = rb_open,
	.read = rb_read,
	.llseek = rb_seek,
};
static struct miscdevice rb_device = {
	.minor = MISC_DYNAMIC_MINOR,
	.name = "hgw500-flash-readonly",
	.fops = &rb_ops,
	.mode = 0400,
};

static int __init rb_init(void)
{
	int ret;

	if (!of_machine_is_compatible("mitrastar,hgw-500bna-qcv2"))
		return -ENODEV;
	flash = ioremap(FLASH_BASE, FLASH_BYTES);
	if (!flash)
		return -ENOMEM;
	ret = misc_register(&rb_device);
	if (ret)
		iounmap(flash);
	return ret;
}
static void __exit rb_exit(void)
{
	misc_deregister(&rb_device);
	iounmap(flash);
}
module_init(rb_init);
module_exit(rb_exit);
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("HGW500 bounded read-only SPI window for local readback");
