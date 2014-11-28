#!/usr/bin/env bash

# Source function library.
. /etc/init.d/functions

/vagrant/vagrant/extraRepos.sh;
/vagrant/vagrant/httpd.sh;
/vagrant/vagrant/php.sh;
/vagrant/vagrant/iptables.sh;

echo '----[Starting httpd]--';
ACTIVE=$(service httpd status | sed 's/^.* //');
[ $ACTIVE == 'stopped' ] && service httpd start || service httpd restart;

setenforce 0 > /dev/null
