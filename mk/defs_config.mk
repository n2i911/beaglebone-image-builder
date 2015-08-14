#
# configuration files
#

# config directory
config_dir := $(root_dir)/config

hosts_file := $(config_dir)/rootfs/hosts.$(DEB_CODENAME)
hostname_file := $(config_dir)/rootfs/hostname.$(DEB_CODENAME)
sources_list_file := $(config_dir)/rootfs/sources.list.$(DEB_CODENAME)
interfaces_file := $(config_dir)/rootfs/interfaces.$(DEB_CODENAME)

busybox_config := $(config_dir)/busybox_config
