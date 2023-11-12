#!/bin/sh

dnf update -y
dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm

## add Neimar's repo
crb enable
dnf -y install https://opensource.vsphone.com.br/vsphone-opensource.rpm

dnf update -y

## install kernel packages for add modules
yum install -y wget kernel-devel-$(uname -r) kernel-devel-matched-$(uname -r) kernel-headers-$(uname -r)

## add rtpengine packages
yum install -y ngcp-rtpengine ngcp-rtpengine-kernel ngcp-rtpengine-dkms iptables-services iptables-devel

## Load iptables module on kernel
modprobe ip_tables

## Compile rtengine module
cd /usr/src/*rtpengine*
make -j4
make install

## Load rtpengine module on kernel
modprobe xt_RTPENGINE

## Rtpengine packet forwarding to table=0
echo 'add 0' > /proc/rtpengine/control

## reduce image disk space
yum clean all && rm -rf /var/cache/yum