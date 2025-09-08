#!/data/data/com.termux/files/usr/bin/sh

# My su script for my rooted Android tablet using Termux.
# 
# You need to do a normal su before and then "mkdir /data/root"
# as the default $HOME for the root user is / on Android devices
# and we have no write permission for a /root there.
#
# Do I need/want /system/bin in $PATH?

su -c "HOME=/data/root \
       PATH=/data/root/bin:/data/data/com.termux/files/usr/bin:/system/bin \
       SHELL=/data/data/com.termux/files/usr/bin/zsh /data/data/com.termux/files/usr/bin/zsh -l && cd /data/root"

