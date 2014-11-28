#!/usr/bin/env bash

INSTALLED=$(yum info epel-release | grep Repo | sed -n "/\installed/p" | wc -l)
if [ $INSTALLED -eq 0 ]; then
      echo '---[Installing extra repositories]---';
      yum -y -q install epel-release;
      rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
else
    echo '---[Already installed extra repositories]--';
fi

echo '---[Updating OS]---';
yum -y -q update > /dev/null;
