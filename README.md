boold
=====

Wifi enabled Linux boot-loader, which uses a linux kernel and pxe to chainload an arbitrary linux system.

This is meant as a follow-up to our [presentation](http://chemnitzer.linux-tage.de/2014/de/vortraege/detail/344 "presentation") at __Chemnitz Linuxtage 2014__.

For a successful bulld, you need the following prerequisites:

* Buildroot
* Host-Toolchain to create the Target-Toolchains  (something like
build-essential on Debian based systems)
* kexec-utils, pxe-kexec
* Some pendrive to boot from

The structure:

    buildroot:
       board
           openthinclient
               boold 
               busybox-1.22.x.config 
               Kernel.config-i686 
               ...
       fs-overlay
           ...
       configs
           openthinclient_boold_defconfig
    sources
       toolchain.file (adapt it to your needs)
       buildroot_usb.sh 
       sysclinux.config 
       
You may either copy the whole folder to a Buildroot working directory or
rebuild the whole config (e.g. to an external folder)  as you please.

1. get buildroot and boold github repo
2. get kexec-utils, pxe-kexec
3. cd  $buildroot
   make openthinclient_boold_config
   make toolchain
   wait for some time
4. compile additional software (kexec, pxe-kexec) either with cmake or autotools

> ./configure --host=i686-linux --prefix=$buildroot/openthinclient/fs-overlay/

>  cmake -DCMAKE_TOOLCHAIN_file=./toolchain.file

5. make all
6. create a pendrive with one, bootable ext2 partiton, install extlinux and
copy kernel and initrd to it




