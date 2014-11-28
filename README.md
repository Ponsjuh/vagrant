Vagrant provising scripts
=========================

Supported OS
-------------------
- CentOS 6
- CentOS 7

Currently installing
- Epel repository
- httpd
- php


example
-------
config.vm.provision "shell", path: "config/vagrant/run.sh"
