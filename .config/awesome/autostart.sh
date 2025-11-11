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

source $HOME/.zprofile &

exec_applets &

$HOME/.local/scripts/mouse &
$HOME/.local/scripts/random_wall.sh &

run_once picom &
run_once lxqt-policykit-agent &
sleep 1 && run_once protonmail-bridge --no-window &
run_once_flatpak dev.vencord.Vesktop --start-minimized
