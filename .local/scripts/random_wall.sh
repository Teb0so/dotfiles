#!/usr/bin/env bash

WALLPAPPER_DIR=$HOME/Pictures/wals

walls=( "$WALLPAPPER_DIR"/* )

random=($(($RANDOM % ${#walls[@]})))

feh --bg-fill "${walls[$random]}"
