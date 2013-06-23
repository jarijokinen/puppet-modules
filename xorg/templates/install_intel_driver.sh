#!/bin/sh

pkg="xserver-xorg-video-intel_2.20.14-1_amd64.deb"
url="http://ftp.debian.org/debian/pool/main/x/xserver-xorg-video-intel/$pkg"
tmp="/root/$pkg"
wget="/usr/bin/wget"
dpkg="/usr/bin/dpkg"

if [ ! -f $tmp ]; then
  $wget -O $tmp -nd $url
fi
$dpkg -i $tmp
rm $tmp

exit 0
