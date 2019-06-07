#!/bin/bash
mkfs -t ext4 /dev/xvdh
mkdir /opt/mount1
mount /dev/xvdh /opt/mount1
echo /dev/xvdh  /opt/mount1 ext4 defaults,nofail 0 2 >> /etc/fstab