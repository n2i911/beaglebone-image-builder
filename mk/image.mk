build-image: scratch-image debian-image

scratch-image:
	cp $(config_dir)/uboot/* $(target_out_bin)
	cd $(target_out_bin) && env PATH=$(root_dir)/tool:$(PATH) genimage $(target_scratch_rootfs)

debian-image:
	cp $(config_dir)/uboot/* $(target_out_bin)
	cd $(target_out_bin) && env PATH=$(root_dir)/tool:$(PATH) gendebianimage $(target_debian_rootfs)
