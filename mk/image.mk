build-image: scratch-image debian-image

scratch-image:
	$(eval kernel_uts := $(shell cat $(target_out_kernel)/include/generated/utsrelease.h | awk '{print $$3}' | sed 's/\"//g' ))
	cp $(config_dir)/uboot/* $(target_out_bin)
	cd $(target_out_bin) && env PATH=$(root_dir)/tool:$(PATH) genimage $(target_scratch_rootfs) $(kernel_uts)

debian-image:
	$(eval kernel_uts := $(shell cat $(target_out_kernel)/include/generated/utsrelease.h | awk '{print $$3}' | sed 's/\"//g' ))
	cp $(config_dir)/uboot/* $(target_out_bin)
	cd $(target_out_bin) && env PATH=$(root_dir)/tool:$(PATH) gendebianimage $(target_debian_rootfs) $(kernel_uts)
