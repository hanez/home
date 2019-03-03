#!/bin/bash                                                                                                                                                                      

acme.sh --cron --force --home /root/.acme.sh

for host in $(ls /etc/acme | tr '\n' ' '); do
    echo "Creating .pem File for $host: /etc/acme/$host/$host.pem"
    cat /etc/acme/$host/$host.key > /etc/acme/$host/$host.pem
    cat /etc/acme/$host/fullchain.cer >> /etc/acme/$host/$host.pem
done

/etc/init.d/lighttpd restart

