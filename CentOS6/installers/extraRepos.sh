#!/usr/bin/env bash

INSTALLED=$(yum info epel-release | grep Repo | sed -n "/\installed/p" | wc -l)
if [ $INSTALLED -eq 0 ]; then
      echo '---[Installing extra repositories]---';
      rpm -Uvh http://mirrors.kernel.org/fedora-epel/6/i386/epel-release-6-8.noarch.rpm
      rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
else
    echo '---[Already installed extra repositories]--';
fi

echo '---[Updating OS]---';
yum -y -q update > /dev/null;
