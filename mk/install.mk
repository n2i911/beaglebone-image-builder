install: install-spl install-uboot install-rootfs

install-spl:
	sudo dd if=$(target_out_bin)/$(target_uboot_spl) of=$(INSTALL_DISK) count=1 seek=1 conv=notrunc bs=128K

install-uboot:
	echo $@

install-rootfs:
	echo $@
