#!/usr/bin/env sh

# make sure we never run 2 rsync at the same time
lockfile="/tmp/alpine-mirror.lock"
if [ -z "$flock" ] ; then
  exec env flock=1 flock -n $lockfile "$0" "$@"
fi

src=rsync://rsync.alpinelinux.org/alpine/ 
dest=/data/alpine/

# uncomment this to exclude old v2.x branches
exclude="--exclude v2.* --exclude v3.0 --exclude v3.1 --exclude v3.2 --exclude v3.2 --exclude v3.3 --exclude v3.4 --exclude v3.5 --exclude v3.6 --exclude v3.7 --exclude v3.8 --exclude v3.9 --exclude aarch64/ --exclude armhf/ --exclude armv7/ --exclude ppc64le/ --exclude s390x/ --exclude x86/"

mkdir -p "$dest"
/usr/bin/rsync \
        --archive \
        --update \
        --hard-links \
        --delete \
        --delete-after \
        --delay-updates \
        --timeout=600 \
        --delete-excluded \
        --verbose \
        $exclude \
        "$src" "$dest"

