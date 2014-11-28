#!/usr/bin/env bash

# Source function library.
. /etc/init.d/functions

/vagrant/config/vagrant/installers/extraRepos.sh;
/vagrant/config/vagrant/installers/httpd.sh;
/vagrant/config/vagrant/installers/php.sh;


setenforce 0 > /dev/null
