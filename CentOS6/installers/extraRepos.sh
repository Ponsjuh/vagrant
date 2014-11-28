#!/usr/bin/env bash

echo '---[Installing extra repositories]---';
INSTALLED=$(yum repolist | grep epel | wc -l)
if [ $INSTALLED -eq 0 ]; then
      echo '----[Epel repository]---';
      yum -q -y install epel-release
      rpm --import --quiet /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6 > /dev/null;
else
    echo '---[Already installed epel repository]--';
fi

INSTALLED=$(yum repolist | grep remi | wc -l)
if [ $INSTALLED -eq 0 ]; then
      echo '----[Remi repository]---';
      rpm -Uvh --quiet --nosignature --nodigest http://rpms.famillecollet.com/enterprise/remi-release-6.rpm > /dev/null;
      rpm --quiet --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi > /dev/null;
else
    echo '----[Already installed remi repository]--';
fi

echo '---[Updating OS]---';
yum -y -q update > /dev/null;
