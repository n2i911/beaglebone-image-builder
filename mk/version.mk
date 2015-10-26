uboot_version := u-boot
kernel_version := linux
firmware_version := linux-firmware
busybox_version := busybox

fetch_kernel_cmd := git clone https://github.com/n2i911/bbb-linux.git
fetch_busybox_cmd := git clone git://busybox.net/busybox.git
fetch_uboot_cmd := git clone git://git.denx.de/u-boot.git
fetch_firmware_cmd := git clone https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
fetch_mt7601u_cmd := git clone https://github.com/rcn-ee/mt7601u
