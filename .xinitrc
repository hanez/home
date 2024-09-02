#!/bin/sh

source $HOME/env

# Export DEFAULT_SESSION in this file:
source $HOME/.penv

$HOME/.screenlayout/default.sh

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

