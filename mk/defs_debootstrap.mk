#
# debootstrap
#

#
# amd64 arm64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64
# kfreebsd-i386 mips mipsel powerpc ppc64el s390 s390x sparc
#
DEB_ARCH := armhf

#
# sid stretch jessie wheezy squeeze lenny etch sarge
# woody potato buzz rex bo hamm slink
#
DEB_CODENAME := jessie

DEB_INCLUDE := "apache2,avahi-daemon,bsdmainutils,btrfs-tools,ca-certificates,cpufrequtils,\
	dosfstools,fbset,file,git-core,hdparm,hexedit,hostapd,i2c-tools,initramfs-tools,locales,\
	lowpan-tools,lshw,memtester,mtd-utils,nano,openssh-server,ppp,read-edid,rsync,sudo,systemd,\
	u-boot-tools,udhcpd,usb-modeswitch,usbutils,wireless-tools,wpasupplicant,wvdial,openssh-client,\
	i3-wm,i3status,terminator,suckless-tools,python3,screen,vim,ranger,lightdm,fakeroot build-essential,gpm,\
	openbox,xserver-common,xserver-xorg,xserver-xorg-core,xserver-xorg-video-modesetting,x11-xserver-utils,\
	xserver-xorg-video-fbdev,xserver-xorg-input-evdev,xserver-xorg-input-all,libbluetooth-dev,gdb,cgdb,\
	module-init-tools,strace,xterm,dkms"

DEB_EXCLUDE :=
DEB_COMPONENT := "main contrib non-free"
DEB_DIR := $(target_out_chroot)
DEB_MIRROR := http://ftp.debian.org/debian/

DEB_OPTION := --arch=$(DEB_ARCH) --include=$(DEB_INCLUDE) \
	--foreign $(DEB_CODENAME) $(DEB_DIR) $(DEB_MIRROR)
