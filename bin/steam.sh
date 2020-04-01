#!/bin/bash

#/usr/bin/steam &
#cd /home/hanez/.local/share/Steam/steamapps/common/Thimbleweed\ Park
#export LD_LIBRARY_PATH="./"

TP_PATH="/home/hanez/.local/share/Steam/steamapps/common/Thimbleweed\ Park"

export LD_LIBRARY_PATH=$LD_LIBRARY_APTH:$TP_PATH

/usr/bin/steam -silent

