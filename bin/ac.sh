#!/bin/bash

mv /etc/lighttpd/vhosts.d/systems.findeisen.conf /etc/lighttpd/vhosts.d/systems.findeisen.conf.ssl
mv /etc/lighttpd/vhosts.d/systems.findeisen.conf.nossl /etc/lighttpd/vhosts.d/systems.findeisen.conf

/etc/init.d/lighttpd restart

acme.sh --cron --force --home /root/.acme.sh

for host in $(ls /etc/acme | tr '\n' ' '); do
    echo "Creating .pem File for $host: /etc/acme/$host/$host.pem"
    cat /etc/acme/$host/$host.key > /etc/acme/$host/$host.pem
    cat /etc/acme/$host/fullchain.cer >> /etc/acme/$host/$host.pem
done

mv /etc/lighttpd/vhosts.d/systems.findeisen.conf /etc/lighttpd/vhosts.d/systems.findeisen.conf.nossl
mv /etc/lighttpd/vhosts.d/systems.findeisen.conf.ssl /etc/lighttpd/vhosts.d/systems.findeisen.conf

cat /etc/acme/mail2.zynk.org/fullchain.cer > /opt/mailcow-dockerized/data/assets/ssl/mail2.zynk.org/cert.pem
cat /etc/acme/mail2.zynk.org/mail2.zynk.org.key > /opt/mailcow-dockerized/data/assets/ssl/mail2.zynk.org/key.pem

/etc/init.d/lighttpd restart
/etc/init.d/nginx restart
/etc/init.d/prosody restart

cd /opt/mailcow-dockerized
docker-compose restart

exit 0

