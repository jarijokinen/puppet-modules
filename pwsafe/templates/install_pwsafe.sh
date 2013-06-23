#!/bin/sh

pkg="pwsafe_0.2.0-3_amd64.deb"
url="http://ftp.debian.org/debian/pool/main/p/pwsafe/$pkg"
tmp="/root/$pkg"
wget="/usr/bin/wget"
dpkg="/usr/bin/dpkg"
pwsafe="/usr/bin/pwsafe"

if [ ! -f $pwsafe ]; then
  if [ ! -f $tmp ]; then
    $wget -O $tmp -nd $url
  fi
  $dpkg -i $tmp
  rm $tmp
fi

pkg="libssl0.9.8_0.9.8o-4squeeze14_amd64.deb"
url="http://ftp.debian.org/debian/pool/main/o/openssl/$pkg"
tmp="/root/$pkg"
wget="/usr/bin/wget"
dpkg="/usr/bin/dpkg"

if [ ! -f $tmp ]; then
  $wget -O $tmp -nd $url
fi
$dpkg -i $tmp
rm $tmp

exit 0
