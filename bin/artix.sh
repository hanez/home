#!/bin/bash


rsync -auvPH --delete-after "rsync://orion.artixlinux.org:64873/" /data/artix/repos/
rsync -auvPH --delete-after "rsync://download.artixlinux.org/iso/" /data/artix/iso/

