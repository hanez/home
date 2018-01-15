#!/bin/bash

# Needs NAS_HOST and NAS_MAC defined in ~/.config.sh

source ~/.config.sh

/usr/bin/zenity --question --text "Do You really want to boot your NAS device?"
case $? in
0)
    ping -c 1 $NAS_HOST
    VALUE=$?
    if [ $VALUE == 0 ]; then
    /usr/bin/zenity --info --icon-name=error --text "Boot command failed: Device already up!"
    elif [ $VALUE == 1 ]; then
    /usr/bin/wol $NAS_MAC
    /usr/bin/zenity --info --text "Boot command sent to NAS device."
    fi
;;
esac
