#!/bin/sh

exec_applets() {
    applets="nm-tray volumeicon copyq"

    for applet in $applets; do
        pkill "$applet" 2>/dev/null
        "$applet" &
    done
}

run_once() {
    if ! pgrep -f "$1" >/dev/null 2>&1; then
        "$@" &
    fi
}

run_once_flatpak() {
    if ! pgrep -f "$1" >/dev/null 2>&1; then
        flatpak run "$@" &
    fi
}

exec_applets &

$HOME/.local/scripts/mouse &
nitrogen --restore &

run_once picom &
sleep 1 && run_once protonmail-bridge --no-window &

run_once_flatpak com.discordapp.Discord --start-minimized
