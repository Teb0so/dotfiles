#!/bin/bash

if [[ -n $(mpc status | awk 'NR==2') ]]; then
    printf "「$(mpc -f '%artist% - %title%' | awk 'NR==1')」"
else
    printf " "
fi
