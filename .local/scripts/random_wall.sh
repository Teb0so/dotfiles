#!/usr/bin/env bash

WALLPAPPER_DIR=$HOME/Pictures/wals

walls=( "$WALLPAPPER_DIR"/* )

random=($((RANDOM % ${#walls[@]})))

if ($WAYLAND_DISPLAY); then
    feh --bg-fill "${walls[random]}"
else
    pkill -x swaybg &&
    swaybg -m fill -i "${walls[random]}" & disown
fi
