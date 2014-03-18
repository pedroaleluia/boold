#!/bin/bash
set -x -e

cd ~/develop/ll/Buildroot
sudo mount /dev/sdd1 /mnt
sudo cp output/images/rootfs.cpio.gz /mnt/boot
sudo cp output/images/bzImage /mnt/boot
sync
sudo umount /mnt
