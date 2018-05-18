#!/bin/bash

for ((i = 0; i < 16; i++)); do
    COLOR[$i]=$(xrdb -query | grep "$*color${i}:" | awk '{print $NF}')
done

for ((i = 0; i < 16; i++)); do
    ex -s "./config.h" << EOEX
    %s/\(\[$i\] *= *\"\)#......\(\",\)/\1${COLOR[$i]}\2/g
    wq
EOEX
done

