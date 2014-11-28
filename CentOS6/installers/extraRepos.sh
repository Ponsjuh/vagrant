#!/usr/bin/env bash

INSTALLED=$(yum repolist | grep epel | wc -l)
if [ $INSTALLED -eq 0 ]; then
      echo '---[Installing extra repositories]---';
      yum -q -y install epel-release
      rpm --import --quiet /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6 > /dev/null;
else
    echo '---[Already installed extra repositories]--';
fi

echo '---[Updating OS]---';
yum -y -q update > /dev/null;
