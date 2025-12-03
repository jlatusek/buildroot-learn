#!/bin/sh
qemu-system-arm \
    -M versatilepb \
    -m 256 \
    -kernel output/images/zImage \
    -dtb output/images/versatile-pb.dtb \
    -hda output/images/rootfs.ext2 \
    -append "root=/dev/sda console=/dev/ttyAMA0,115200" \
    -nographic
