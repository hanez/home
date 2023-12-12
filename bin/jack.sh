#!/bin/bash

pasuspender &

jackd -dalsa -r48000 -Xraw -D -Chw:U192k -Phw:U192k 

