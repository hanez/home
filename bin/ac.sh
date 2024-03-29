#!/bin/bash

#cat /etc/lighttpd/vhosts.d/systems.findeisen.conf.nossl > /etc/lighttpd/vhosts.d/systems.findeisen.conf

/etc/init.d/lighttpd restart

acme.sh --cron --force --home /root/.acme.sh

for host in $(ls /etc/acme | tr '\n' ' '); do
    echo "Creating .pem File for $host: /etc/acme/$host/$host.pem"
    cat /etc/acme/$host/$host.key > /etc/acme/$host/$host.pem
    cat /etc/acme/$host/fullchain.cer >> /etc/acme/$host/$host.pem
done

#cat /etc/lighttpd/vhosts.d/systems.findeisen.conf.ssl > /etc/lighttpd/vhosts.d/systems.findeisen.conf

cat /etc/acme/mail.xw3.org/fullchain.cer > /opt/mailcow-dockerized/data/assets/ssl/mail.xw3.org/cert.pem
cat /etc/acme/mail.xw3.org/mail.xw3.org.key > /opt/mailcow-dockerized/data/assets/ssl/mail.xw3.org/key.pem

/etc/init.d/lighttpd restart
/etc/init.d/nginx restart
/etc/init.d/prosody restart

cd /opt/mailcow-dockerized
docker-compose restart

exit 0

