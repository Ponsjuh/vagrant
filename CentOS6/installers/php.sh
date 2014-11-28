#!/usr/bin/env bash

INSTALLED=$(yum info php | grep Repo | sed -n "/\installed/p" | wc -l)
if [ $INSTALLED -eq 0 ]; then
    echo '---[Installing PHP]---';
    yum -y -q install php php-mysql php-mbstring php-devel php-gd php-pecl-xdebug php-pspell php-snmp php-odbc php-xmlrpc php-xml php-imap php-mssql php-ldap php-mcrypt > /dev/null;
    sed -i 's|error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT|error_reporting = E_ALL|' /etc/php.ini
    sed -i 's|display_errors = Off|display_errors = On|' /etc/php.ini
    sed -i 's|;date.timezone =|date.timezone = "Europe/Amsterdam"|' /etc/php.ini
else
    echo '----[Already installed PHP]--';
fi
