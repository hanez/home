#!/bin/bash

rsync -v -r --delete --progress --exclude=/dev --exclude=/tmp -e ssh root@217.160.187.113:/ /data/server/
