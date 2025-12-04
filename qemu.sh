#!/bin/sh

qemu-system-arm \
    -M versatilepb \
    -m 256 \
    -kernel output/images/zImage \
    -dtb output/images/versatile-pb.dtb \
    -drive file=output/images/rootfs.ext2,if=scsi,format=raw \
    -append "rootwait root=/dev/sda console=ttyAMA0,115200" \
    -serial stdio \
    -net nic,model=rtl8139 -net user \
    -netdev user,id=n1,hostfwd=tcp::2222-:22 \
    -device virtio-net-pci,netdev=n1
