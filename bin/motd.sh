#!/bin/ash

# this one is creating my /etc/motd file via cron to get some network 
# statistics when logging in to my servers.

#echo "" >> /etc/motd
vnstat -i eth0 -h 24 > /etc/motd
#vnstat -i eth0 -d 7 >> /etc/motd
#vnstat -i eth0 -m 6 >> /etc/motd
#vnstat -i eth0 -y 6 >> /etc/motd

