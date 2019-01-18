#!/bin/ash

# this one is creating my /etc/motd file via cron to get some network 
# statistics when logging in to my servers.

echo "" > /etc/motd
hostname -f >> /etc/motd
echo "" >> /etc/motd
vnstat >> /etc/motd

