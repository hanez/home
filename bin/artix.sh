#!/bin/bash


rsync -auvPH --delete-after "rsync://mirror1.artixlinux.org/artix-linux/*" /data/artix/repos/
rsync -auvPH --delete-after "rsync://download.artixlinux.org/iso/*" /data/artix/iso/

