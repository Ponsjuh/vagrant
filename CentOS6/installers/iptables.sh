#!/usr/bin/env bash

INSTALLED=$(iptables -L | grep http | wc -l);
if [ $INSTALLED -eq 0 ]; then
    echo '---[Configuring Iptables]---';
    iptables -I INPUT 5 -p tcp -m tcp --dport 80 -j ACCEPT
    service iptables save;
else
    echo '---[Already configured Iptables]---';
fi
