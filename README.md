Vagrant provisioning scripts
=========================

Supported OS
-------------------
- CentOS 6
- CentOS 7

Currently installing
--------------------
- Epel repository
- httpd
- php


example
-------
config.vm.provision "shell", path: "run.sh"


Todo
----

- Make httpd use the default /var/www/html as DocumentRoot
