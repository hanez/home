#!/bin/bash 
#----------------------------------------------------------------------
# Author: haveaniceday
# Version: 1, Last updated: 12/2007
#----------------------------------------------------------------------
 
 # fdisk finden 
 PATH="/sbin:$PATH" 
 if [ $# -lt 1 ] 
 then 
         echo "usage: ${0##*/} <image>" 
         exit 1 
 fi 
 
 IMAGE=$1 
 if [ ! -f $IMAGE ] 
 then 
         echo "Warnung, $IMAGE ist kein File" 
 fi 
 
 # tr -d '*' => bootflag entfernen 
 LANG=C fdisk -lu $IMAGE  2>&1 | tr -d '*' | grep "$IMAGE[a-z0-9]" | while read part start end blocks id rest 
 do 
         echo 
         echo "$read $part $start $end $blocks $id $rest" 
         case $id in 
         5|f|85) echo "Ignoriere extended partition" 
            continue 
            ;; 
         82) echo "Ignoriere Swap" 
            continue 
            ;; 
         *) 
           ;; 
         esac 
 
         let offset=$start*512 
         echo mount -o loop,ro,offset=$offset $IMAGE /mnt 
 done 
 exit 0 
