#!/bin/bash

for i in `seq 1 255`; do
ping -c 1 192.168.55.$i;
done
