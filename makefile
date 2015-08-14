#
# This makefile will help to build Debian-based root filesystem, kernel and u-boot for TI Beaglebone Black
#

root_dir := $(shell pwd)

include mk/version.mk
include mk/defs.mk
include mk/defs_board.mk
include mk/defs_debootstrap.mk
include mk/defs_config.mk
include mk/download.mk

.PHONY: all

all: stamp-kernel stamp-uboot stamp-rootfs


# kernel
include mk/kernel.mk
stamp-kernel:
	make build-kernel
	touch $@

clean-kernel:
	make kernel-clean
	rm -rf stamp-kernel

distclean-kernel:
	rm -rf $(target_out_kernel) stamp-kernel

# u-boot
include mk/uboot.mk
stamp-uboot:
	make build-uboot
	touch $@

clean-uboot:
	make uboot-clean
	rm -f stamp-uboot

distclean-uboot:
	rm -rf $(target_out_uboot) stamp-uboot

# rootfs
include mk/rootfs.mk
stamp-rootfs:
	make build-rootfs
	touch $@

distclean-rootfs:
	sudo rm -rf $(target_out_busybox) $(target_out_rootfs) $(target_out_chroot) $(target_debian_rootfs) stamp-rootfs

clean: distclean-uboot distclean-kernel distclean-rootfs
	rm -rf $(target_out)

distclean: clean
	rm -rf $(src_dir)

# image
include mk/image.mk
stamp-image: all
	make build-image
	touch $@

clean-image:
	rm -rf $(target_scratch_image) $(target_debian_image)
	rm stamp-image

help:
	@echo ""
	@echo ""
	@echo "               beaglebone-image-builder"
	@echo "========================================================"
	@echo "# kernel:"
	@echo "  make clean-kernel; make stamp-kernel"
	@echo ""
	@echo "# uboot:"
	@echo "  make clean-uboot; make stamp-uboot"
	@echo ""
	@echo "# display HELP:"
	@echo "  make help"
	@echo ""
	@echo ""
