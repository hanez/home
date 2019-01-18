#!/bin/ash

echo "" > /etc/motd
hostname -f >> /etc/motd
echo "" >> /etc/motd
vnstat >> /etc/motd

