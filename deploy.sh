#!/bin/env bash

set -e

script_path=$(pwd)

source MANIFEST.sh

for dir in "${dirs[@]}"; do
    array_name="$dir[@]"
    for file in "${!array_name}"; do

        if [[ $dir == "home" ]]; then
            actual_path=$HOME/
            actual_file_path="$script_path"/"$file"
        else
            actual_path=$HOME/."$dir"/
            actual_file_path="$script_path"/."$dir"/"$file"
        fi

        mkdir -p "$actual_path"

        if [[ -L "$actual_path""$file" ]]; then
            echo "[WARNING] "$HOME"/."$dir"/"$file" is alredy a symlink. Doing nothing"
        elif [[ -e "$actual_path""$file" ]]; then
            echo "[ERROR] "$HOME"/."$dir"/"$file" alredy exists and its not a symlink. Please fix this manually"
            exit 1
        else
            echo Deploying "$actual_file_path" to "$actual_path"
            ln -s "$actual_file_path" "$actual_path"
        fi
    done
done
