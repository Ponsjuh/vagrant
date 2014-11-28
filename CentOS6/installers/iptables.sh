#!/usr/bin/env bash

echo '---[Configuring Iptables]---';
INSTALLED=$(iptables -L | grep http | wc -l);
if [ $INSTALLED -eq 0 ]; then
    echo '   > [CONFIG  ] Adding port 80 to INPUT chain';
    iptables -I INPUT 5 -p tcp -m tcp --dport 80 -j ACCEPT
    service iptables save > /dev/null;
else
    echo '   > [SKIPPING ] Iptables';
fi
