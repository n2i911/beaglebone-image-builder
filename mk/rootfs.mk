build-rootfs: scratch-rootfs debian-rootfs

scratch-rootfs: $(busybox_version) $(target_scratch_rootfs)
debian-rootfs: debian-rootfs-config

$(busybox_version):
	mkdir -p $(target_out_bin)
	mkdir -p $(target_out_rootfs)
	mkdir -p $(target_out_busybox)
	cp -f config/busybox_config $(target_out_busybox)/.config
	make -C $(busybox_dir) O=$(target_out_busybox) oldconfig
	make -C $(target_out_busybox) CONFIG_PREFIX=$(target_out_rootfs) install

$(target_scratch_rootfs): $(target_out_rootfs) $(target_out_busybox)/.config
	cp -raf $(rootfs_dir)/* $(target_out_rootfs)
	mkdir -p $(target_out_rootfs)/boot/
	cd $(target_out_bin) && genromfs -v \
		-V "ROM Disk" \
		-f $(target_romfs) \
		-x placeholder \
		-d $(target_out_rootfs) 1> romfs.map 2>&1
	cd $(target_out_bin) && env PATH=$(root_dir)/tool:$(PATH) geninitrd $(target_scratch_rootfs)

debian-rootfs-config: $(target_debian_rootfs)
	-sudo mount proc $(DEB_DIR)/proc -t proc
	-sudo mount sysfs $(DEB_DIR)/sys -t sysfs
	sudo cp $(sources_list_file) $(DEB_DIR)/etc/apt/sources.list
	sudo cp $(hostname_file) $(DEB_DIR)/etc/hostname
	sudo cp $(hosts_file) $(DEB_DIR)/etc/hosts
	sudo cp $(interfaces_file) $(DEB_DIR)/etc/network/interfaces
	sudo cp $(motd_file) $(DEB_DIR)/etc/motd
	sudo cp $(issue_file) $(DEB_DIR)/etc/issue
	sudo cp $(issuenet_file) $(DEB_DIR)/etc/issue.net
	sudo mkdir -p $(DEB_DIR)/boot/uboot
	-sudo chroot $(DEB_DIR) /bin/bash -c "adduser debian"
	-sudo chroot $(DEB_DIR) /bin/bash -c "usermod -a -G sudo debian"
	sudo rm $(DEB_DIR)/etc/resolv.conf
	-sudo umount $(DEB_DIR)/proc
	-sudo umount $(DEB_DIR)/sys
	cd $(DEB_DIR) && sudo tar czf $(target_debian_rootfs) *

$(target_debian_rootfs):
	mkdir -p $(DEB_DIR)
	sudo debootstrap $(DEB_OPTION)
	sudo cp $(qemu_filepath) $(DEB_DIR)/usr/bin/
	sudo cp /etc/resolv.conf $(DEB_DIR)/etc/
	sudo chroot $(DEB_DIR) /debootstrap/debootstrap --second-stage
	touch debian-rootfs-config
