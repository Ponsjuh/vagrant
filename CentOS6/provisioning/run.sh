#!/usr/bin/env bash

# Source function library.
. /etc/init.d/functions

/vagrant/provisioning/extraRepos.sh;
/vagrant/provisioning/httpd.sh;
/vagrant/provisioning/php.sh;
/vagrant/provisioning/iptables.sh;

echo '----[Starting httpd]--';
ACTIVE=$(service httpd status | sed 's/^.* //');
[ $ACTIVE == 'stopped' ] && service httpd start || service httpd restart;

setenforce 0 > /dev/null
