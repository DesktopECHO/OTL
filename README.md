Older Than Light • pihole-FTL for CentOS 7 on ARMv7

The official Pihole-FTL v5.17+ binaries require glibc-2.28 or newer moving forward, effectively ending support for CentOS 7 and other distros released before mid-2018. 

This script install the tools necessary to build pihole-FTL on CentOS 7

Instructions - In Pi-hole for Android, or on any ARMv7-powered CentOS 7 installation, download and run the OTL script:

```wget -O otl.sh https://raw.githubusercontent.com/DesktopECHO/OTL/main/otl.sh```

```sudo bash otl.sh```


Wait a few minutes for the compiler toolchain to install and the build the latest pihole-FTL release:

![FTL Built on CentOS 7 (glibc-2.17)](https://user-images.githubusercontent.com/33142753/188801114-0a97db6a-81cd-4252-9f1d-e57854095c4f.png)

Note - The following repos are required in yum.repos.d

`````
[epel]
name=Epel rebuild for armhfp
baseurl=https://armv7.dev.centos.org/repodir/epel-pass-1/
enabled=1
gpgcheck=0

[remi]
name=Remi - RPM repository for Enterprise Linux 7 - $basearch
mirrorlist=http://cdn.remirepo.net/enterprise/7/remi/mirror
enabled=1
gpgcheck=1
gpgkey=https://rpms.remirepo.net/RPM-GPG-KEY-remi

[community-php74-testing]
name=Remi - RPM repository for PHP Backports - $basearch
baseurl=https://armv7.dev.centos.org/repodir/community-php74-testing/
enabled=1
gpgcheck=0
`````
