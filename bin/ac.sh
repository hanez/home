#!/bin/bash

acme.sh --cron --force --home /root/.acme.sh

for host in $(ls /etc/acme | tr '\n' ' '); do
    echo "Creating .pem File for $host: /etc/acme/$host/$host.pem"
    cat /etc/acme/$host/$host.key > /etc/acme/$host/$host.pem
    cat /etc/acme/$host/fullchain.cer >> /etc/acme/$host/$host.pem
done

/etc/init.d/lighttpd restart
/etc/init.d/nginx restart
/etc/init.d/prosody restart

cat /etc/acme/mail.xw3.org/fullchain.cer > /opt/mailcow-dockerized/data/assets/ssl/mail.xw3.org/cert.pem
cat /etc/acme/mail.xw3.org/mail.xw3.org.key > /opt/mailcow-dockerized/data/assets/ssl/mail.xw3.org/key.pem
cd /opt/mailcow-dockerized
docker-compose restart

exit 0

