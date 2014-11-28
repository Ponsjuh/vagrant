#!/usr/bin/env bash

# Source function library.
. /etc/init.d/functions

/vagrant/config/vagrant/installers/extraRepos.sh;



setenforce 0 > /dev/null
