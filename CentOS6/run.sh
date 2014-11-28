#!/usr/bin/env bash

# Source function library.
. /etc/init.d/functions

/vagrant/installers/extraRepos.sh;

setenforce 0 > /dev/null
