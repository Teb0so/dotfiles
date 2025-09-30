#!/bin/env bash

set -e

script_path=$(pwd)
hostname=$(cat /etc/hostname)

if [[ -e "$script_path"/config_"$hostname".sh ]]; then
    source "$script_path"/config_"$hostname".sh
else
    source "$script_path"/config_default.sh
fi

for dir in "${dirs[@]}"; do
    array_name="$dir[@]"
    for file in "${!array_name}"; do

        if [[ $dir == "home" ]]; then
            path=$HOME/
            file_path="$script_path"/"$file"
        else
            path=$HOME/."$dir"/
            file_path="$script_path"/."$dir"/"$file"
        fi

        mkdir -p "$path"

        if [[ -L "$path""$file" ]]; then
            echo "[WARNING] "$HOME"/."$dir"/"$file" is alredy a symlink. Doing nothing"
        elif [[ -e "$path""$file" ]]; then
            echo "[ERROR] "$HOME"/."$dir"/"$file" alredy exists and its not a symlink. Please fix this manually"
            exit 1
        else
            echo Deploying "$file_path" to "$path"
            ln -s "$file_path" "$path"
        fi
    done
done
