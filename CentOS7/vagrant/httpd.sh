#!/usr/bin/env bash

INSTALLED=$(yum info httpd | grep Repo | sed -n "/\installed/p" | wc -l)
if [ $INSTALLED -eq 0 ]; then
    echo '---[Installing httpd]---';
    yum -y -q install httpd openssl mod_ssl > /dev/null

    sed -i "s|#ServerName www.example.com:80|ServerName intradev.zetacom.lh:80|" /etc/httpd/conf/httpd.conf
    sed -i 's|ServerSignature On|ServerSignature Off|' /etc/httpd/conf/httpd.conf
    sed -i 's|#EnableSendfile Off|EnableSendfile Off|' /etc/httpd/conf/httpd.conf

    echo 'NameVirtualHost *:80' >> /etc/httpd/conf/httpd.conf
    echo "# Include the virtual host configurations:" >> /etc/httpd/conf/httpd.conf
    echo "Include sites-enabled/" >> /etc/httpd/conf/httpd.conf

    mkdir /etc/httpd/sites-{available,enabled}


    cat > /etc/httpd/sites-available/zetacom-ssl <<EOF
<VirtualHost *:80>
    ServerName intra.zetacom.lh
    DocumentRoot /var/www/html/intranet/public

    SetEnv APPLICATION_ENV "development"

    <Directory /var/www/html/intranet/public>
        DirectoryIndex index.php
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>
</VirtualHost>
EOF
    ln -s /etc/httpd/sites-available/zetacom-ssl /etc/httpd/sites-enabled/00-zetacom-ssl;

    systemctl --quiet enable httpd.service

else
    echo '----[Already installed httpd]--';
fi

echo '----[Starting httpd]--';
ACTIVE=$(systemctl is-active httpd);
[ $ACTIVE == 'inactive' ] && systemctl start httpd.service || systemctl restart httpd.service;
