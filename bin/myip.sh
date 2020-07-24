#!/bin/bash

# http://askubuntu.com/questions/95910/command-for-determining-my-public-ip

# Works too but very slow (a lot more features available):
# curl ifconfig.me

#wget -qO- http://ipecho.net/plain; echo

MY_IP="`wget -qO- http://ipecho.net/plain`"

echo $MY_IP

MY_PROVIDER="`whois $MY_IP | awk '/role/{getline; print}' | awk -F  ":" '{print $2}' | awk '{$1=$1;print}'`"

echo $MY_PROVIDER

