#!/bin/sh

export DISPLAY=:0.0

xrandr --output DisplayPort-0 --mode 2560x1440 --pos 0x0 --rotate normal --output DisplayPort-1 --primary --mode 2560x1440 --pos 2560x0 --rotate normal --output DisplayPort-2 --mode 2560x1440 --pos 5120x0 --rotate normal --output HDMI-A-0 --off
#xrandr --output DisplayPort-0 --mode 2560x1440 --pos 0x0 --rotate normal --dpi 144 --output DisplayPort-1 --primary --mode 2560x1440 --pos 2560x0 --rotate normal --dpi 144 --output DisplayPort-2 --mode 2560x1440 --pos 5120x0 --rotate normal --dpi 144 --output HDMI-A-0 --off

# Source: https://superuser.com/questions/644804/disable-screensaver-screen-blank-via-command-line
xset s off
xset s noblank
xset -dpms

