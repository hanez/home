#!/bin/bash

. ~/.env

# Export DEFAULT_SESSION in this file:
. ~/.penv

# Xorg screen setup
export DISPLAY=:0.0

xrandr --output DisplayPort-0 --mode 2560x1440 --pos 0x0 --rotate normal --output DisplayPort-1 --primary --mode 2560x1440 --pos 2560x0 --rotate normal --output DisplayPort-2 --mode 2560x1440 --pos 5120x0 --rotate normal --output HDMI-A-0 --off

# Disable screen blanking
# Source: https://superuser.com/questions/644804/disable-screensaver-screen-blank-via-command-line
xset s off
xset s noblank
xset -dpms

if [[ "$1" == "xterm" ]]; then
    shift
fi

case $1 in
    awesome)
        exec dbus-launch awesome
    ;;
    qtile)
        while true; do
            exec dbus-launch qtile start
        done
    ;;
    *)
        exec dbus-launch $DEFAULT_SESSION
    ;;
esac

