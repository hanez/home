#!/bin/bash

# Needs NAS_HOST and NAS_USER defined in ~/.config.sh

source ~/.config.sh

/usr/bin/zenity --question --text "Do You really want to shutdown your NAS device?"
case $? in
0)
    /usr/bin/ssh $NAS_USER@$NAS_HOST "/usr/bin/sudo /sbin/shutdown -h -P now"
    VALUE=$?
    if [ $VALUE == 0 ]; then
    /usr/bin/zenity --info --text "Shutdown command send to NAS device."
    elif [ $VALUE == 255 ]; then
    /usr/bin/zenity --info --icon-name=error --text "Shutdown command failed: No route to host"
    fi
;;
esac
