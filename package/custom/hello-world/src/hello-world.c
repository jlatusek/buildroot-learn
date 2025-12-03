/* Standardowe zbiory nagłówkowe */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/uaccess.h>
MODULE_LICENSE("GPL v2");
#include <linux/device.h>
#include <linux/fs.h>
#include <linux/cdev.h>
#include <linux/mm.h>

int init_ster(void);
void cleanup_ster(void);

int init_ster(void)
{
	printk(KERN_INFO "Hejka naklejka\n");
	return 0;
}

module_init(init_ster);

void cleanup_ster(void)
{
	printk(KERN_INFO "Bye bye.\n");
}
module_exit(cleanup_ster);
