#!/data/data/com.termux/files/usr/bin/bash

# My su script for my rooted Android tablet using Termux.
# 
# You need to do a normal su before and then "mkdir /data/root"
# as the default $HOME for the root user is / on Android devices
# and we have no write permission for a /root there.
#
# /system/bin PATH?

su -c "HOME=/data/root \
       PATH=/data/data/com.termux/files/usr/bin \
       SHELL=/data/data/com.termux/files/usr/bin/zsh /data/data/com.termux/files/usr/bin/zsh -l && cd /data/root"

