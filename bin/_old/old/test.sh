#!/bin/bash

foo=aaabbbccc; bar=zzz; lop=`echo $foo | sed -e s/aaa/$bar/`; echo $lop

foo=aaabbbccc; bar=zzz; lop=`echo $foo | sed -e s/aaa/$bar/`; echo $lop

foo=/home/hanez/fooo; bar=/home/hanez; lop=`echo $foo | sed -e "s|\${bar}|AAAA|"`; echo $lop
echo $bar
