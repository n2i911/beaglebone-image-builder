# beaglebone-image-builder
Help to create a debian-based distribution for TI beaglebone

* prerequisites: debootstrap, qemu-arm-static, sfdisk

  apt-get install debootstrap qemu-user-static util-linux

* Toolchain:

  [Linaro Releases](https://releases.linaro.org/15.02/components/toolchain/binaries/)

* Storage layout:

  Will create two partitions, FAT16 filesysteam for boot partition and EXT4 for root filesystem.

  The u-boot.img and uEnv would be placed in boot partition, and the MLO would be written at the

  offset 256KB.


* help:

  **make help** would display the HELP message
