#!/bin/sh

BUILD_ROOT_DIR=$(dirname $(realpath $BASH_SOURCE[0]))

if [ ! -f ${BUILD_ROOT_DIR}/board/custom/rootfs_overlay/root/.ssh/authorized_keys ]; then
    cp ~/.ssh/id_rsa.pub ${BUILD_ROOT_DIR}/board/custom/rootfs_overlay/root/.ssh/authorized_keys
fi

qemu-system-arm \
    -M versatilepb \
    -m 256 \
    -kernel output/images/zImage \
    -dtb output/images/versatile-pb.dtb \
    -drive file=output/images/rootfs.ext2,if=scsi,format=raw \
    -append "rootwait root=/dev/sda console=ttyAMA0,115200" \
    -serial stdio \
    -net nic,model=rtl8139 -net user,hostfwd=tcp::2222-:22
