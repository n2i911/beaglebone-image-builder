#Create source and out directory
$(shell mkdir -p $(src_dir))
$(shell mkdir -p $(target_out))

# Check cross toolchain
filepath := $(shell which $(CROSS)gcc 2> /dev/null)
ifeq ($(strip $(filepath)),)
$(error No Toolchain $(CROSS)gcc)
endif

# Check debootstrap
filepath := $(shell which debootstrap 2> /dev/null)
ifeq ($(strip $(filepath)),)
$(error No debootstrap package)
endif

# Check qemu-arm-static
qemu_filepath := $(shell which qemu-arm-static 2> /dev/null)
ifeq ($(strip $(qemu_filepath)),)
$(error No qemu-user-static package)
endif

# Check kernel source
$(info check kernel source: )
filepath := $(shell ls $(kernel_dir) 2> /dev/null)
ifeq ($(strip $(filepath)),)
$(info No kernel source, download now...)
$(shell $(fetch_kernel_cmd) $(kernel_dir))
#$(shell git --work-tree $(kernel_dir) checkout --track -b $(kernel_version) origin/$(kernel_version))
endif

# Check u-boot source
$(info check u-boot source: )
filepath := $(shell ls $(uboot_dir) 2> /dev/null)
ifeq ($(strip $(filepath)),)
$(info No u-boot source, download now...)
$(shell $(fetch_uboot_cmd) $(uboot_dir))
endif

# Check busybox source
$(info check busybox source: )
filepath := $(shell ls $(busybox_dir) 2> /dev/null)
ifeq ($(strip $(filepath)),)
$(info No busybox source, download now...)
$(shell $(fetch_busybox_cmd) $(busybox_dir))
endif

# Check linux-firmware
$(info check linux-firmware: )
filepath := $(shell ls $(firmware_dir) 2> /dev/null)
ifeq ($(strip $(filepath)),)
$(info No linux-firmware, download now...)
$(shell $(fetch_firmware_cmd) $(firmware_dir))
endif

# Check mt7601u
$(info check mt7601u: )
filepath := $(shell ls $(mt7601u_dir) 2> /dev/null)
ifeq ($(strip $(filepath)),)
$(info No mt7601u, download now...)
$(shell $(fetch_mt7601u_cmd) $(mt7601u_dir))
endif
