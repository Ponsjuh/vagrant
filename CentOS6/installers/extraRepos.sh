#!/usr/bin/env bash

INSTALLED=$(yum repolist | grep epel | wc -l)
if [ $INSTALLED -eq 0 ]; then
      echo '---[Installing extra repositories]---';
      yum -q -y install epel-release
      rpm --import --quiet /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6 > /dev/null;

      rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
      rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi

else
    echo '---[Already installed extra repositories]--';
fi

echo '---[Updating OS]---';
yum -y -q update > /dev/null;
