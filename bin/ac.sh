#!/bin/bash

cd /etc/lighttpd/vhosts.d

HOSTS="de.hacknf.lists
de.waffelgut
org.linspector
org.xw3.cloud
org.xw3.git
org.xw3.lists
org.xw3.mail
org.xw3.siem
org.xw3.sql"

for host in $HOSTS; do 
    cat /etc/lighttpd/vhosts.d/$host.conf.min > /etc/lighttpd/vhosts.d/$host.conf
done
/etc/init.d/lighttpd restart

mv /root/.acme.sh/acme.sh.log /root/.acme.sh/$(date +%s).log 

acme.sh --cron --force --home /root/.acme.sh

for host in $(ls /etc/acme | tr '\n' ' '); do
    echo "Creating .pem File for $host: /etc/acme/$host/$host.pem"
    cat /etc/acme/$host/$host.key > /etc/acme/$host/$host.pem
    cat /etc/acme/$host/fullchain.cer >> /etc/acme/$host/$host.pem
done

for host in $HOSTS; do 
    cat /etc/lighttpd/vhosts.d/$host.conf.full > /etc/lighttpd/vhosts.d/$host.conf
done
/etc/init.d/lighttpd restart

#/etc/init.d/nginx restart

/etc/init.d/prosody restart

cat /etc/acme/mail.xw3.org/fullchain.cer > /opt/mailcow-dockerized/data/assets/ssl/mail.xw3.org/cert.pem
cat /etc/acme/mail.xw3.org/mail.xw3.org.key > /opt/mailcow-dockerized/data/assets/ssl/mail.xw3.org/key.pem
cd /opt/mailcow-dockerized
docker-compose restart

exit 0

