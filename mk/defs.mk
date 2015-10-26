# source directory
src_dir := $(root_dir)/src
uboot_dir := $(src_dir)/$(uboot_version)
kernel_dir := $(src_dir)/$(kernel_version)
busybox_dir := $(src_dir)/$(busybox_version)
firmware_dir := $(src_dir)/$(firmware_version)
mt7601u_dir := $(src_dir)/mt7601u
rootfs_dir := $(root_dir)/rootfs

# output directory
target_out := $(root_dir)/out
target_out_bin := $(target_out)/bin
target_out_kernel := $(target_out)/$(kernel_version)
target_out_uboot := $(target_out)/$(uboot_version)
target_out_busybox := $(target_out)/$(busybox_version)
target_out_chroot := $(target_out)/chroot
target_out_rootfs := $(target_out)/rootfs
target_out_kernel_firmware := $(target_out_bin)/firmware
target_out_kernel_dtbs := $(target_out_bin)/dtbs
target_out_kernel_modules := $(target_out_bin)/modules

# config directory
config_dir := $(root_dir)/config

kernel_config := $(config_dir)/kernel/bb.org_defconfig

qemu_filepath :=

# target file
target_kernel := zImage
target_uboot := u-boot.bin
target_uboot_spl := MLO
target_scratch_rootfs := $(target_out_bin)/scratch.rootfs.tgz
target_debian_rootfs := $(target_out_bin)/debian.rootfs.tgz
target_romfs := $(target_out_bin)/romfs.img
target_initrd := $(target_out_bin)/initrd
target_scratch_image := $(target_out_bin)/beaglebone-black-scratch.img
target_debian_image := $(target_out_bin)/beaglebone-black-debian.img
