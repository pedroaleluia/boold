boold
=====

Wifi enabled Linux boot-loader

This is mean as a follow-up to our presentation at Chemnitz Linuxtage 2014.

For a successful bulld, you need the following prerequisites:

-Buildroot
-Host-Toolchain to create the Target-Toolchains  (something like
build-essential on Debian based systems)
-kexec-utils, pxe-kexec
-Some pendrive to boot from

The structure:

buildroot:
| board
| | openthinclient
| | | boold
| | | - busybox-1.22.x.config
| | | - Kernel.config-i686
| | | ...
| | | fs-overlay
| | | ...
| configs
| - openthinclient_boold_defconfig
| sources
| - toolchain.file (adapt it to your needs)
| - buildroot_usb.sh
| - sysclinux.config


You may either copy the whole folder to a Buildroot working directory or
rebuild the whole config (e.g. to an external folder)  as you please.

1) get buildroot and boold github repo
2) get kexec-utils, pxe-kexec
3) cd  $buildroot
   make openthinclient_boold_config
   make toolchain
   wait for some time
4) compile additional software (kexec, pxe-kexec)

|classic|{code}./configure --host=i686-linux --prefix=$buildroot/openthinclient/fs-overlay/{code}|
|cmake|{code}cmake -DCMAKE_TOOLCHAIN_file=./toolchain.file{code}|
5) make all
6) create a pendrive with one, bootable ext2 partiton, install extlinux and
copy kernel and initrd to it




