#!/usr/bin/env bash

# Source function library.
. /etc/init.d/functions

/vagrant/vagrant/extraRepos.sh;
/vagrant/vagrant/httpd.sh;
/vagrant/vagrant/php.sh;


setenforce 0 > /dev/null
