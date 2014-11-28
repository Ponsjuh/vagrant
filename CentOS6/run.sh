#!/usr/bin/env bash

# Source function library.
. /etc/init.d/functions

/vagrant/installers/extraRepos.sh;
/vagrant/installers/httpd.sh;
/vagrant/installers/php.sh;
/vagrant/installers/iptables.sh;

echo '----[Starting httpd]--';
ACTIVE=$(service httpd status | sed 's/^.* //');
[ $ACTIVE == 'stopped' ] && service httpd start || service httpd restart;

setenforce 0 > /dev/null
