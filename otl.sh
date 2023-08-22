#!/bin/bash
#
# otl.sh - Build script for pihole-FTL on CentOS 7
#

[[ ! -f /opt/rh/devtoolset-9/root/usr/bin/gcc ]] && yum -y install https://buildlogs.centos.org/c7-devtoolset-9.armhfp/devtoolset-9-binutils/20211015132728/2.32-16.el7.2.armhfp/devtoolset-9-binutils-2.32-16.el7.2.armv7hl.rpm https://buildlogs.centos.org/c7-devtoolset-9.armhfp/devtoolset-9-gcc/20211014113237/9.3.1-2.2.el7.armhfp/devtoolset-9-gcc-9.3.1-2.2.el7.armv7hl.rpm https://buildlogs.centos.org/c7-devtoolset-9.armhfp/devtoolset-9-gcc/20211014113237/9.3.1-2.2.el7.armhfp/devtoolset-9-gcc-c++-9.3.1-2.2.el7.armv7hl.rpm https://buildlogs.centos.org/c7-devtoolset-9.armhfp/devtoolset-9-gcc/20211014113237/9.3.1-2.2.el7.armhfp/devtoolset-9-libstdc++-devel-9.3.1-2.2.el7.armv7hl.rpm https://buildlogs.centos.org/c7-devtoolset-9.armhfp/devtoolset-9/20211013151212/9.1-1.el7.armhfp/devtoolset-9-runtime-9.1-1.el7.armv7hl.rpm scl-utils vim-common policycoreutils-python python3-pip python-IPy libidn-devel readline-devel cmake3 && rpm -ivh https://github.com/DesktopECHO/Pi-hole-for-Android/raw/legacy/rpm/nettle-3.4.1-7.el7.armv7hl.rpm https://github.com/DesktopECHO/Pi-hole-for-Android/raw/legacy/rpm/nettle-devel-3.4.1-7.el7.armv7hl.rpm --force

cd /tmp ; rm -rf FTL ; git clone --depth=1 https://github.com/pi-hole/FTL.git ; cd FTL

# Fixup for cmake3
sed -i 's/cmake/cmake3/g' build.sh

# Fixup for signals.c
sed -i '/BUS_MCEERR_AR/d' src/signals.c
sed -i '/BUS_MCEERR_AO/d' src/signals.c

# Build pihole-FTL with updated CentOS 7 toolchain
scl enable devtoolset-9 ./build.sh

# Install and Restart pihole-FTL
mkdir -p /var/log/pihole ; chown -R pihole:pihole /var/log/pihole
service pihole-FTL stop ; /bin/cp pihole-FTL /usr/bin/pihole-FTL ; service pihole-FTL start
