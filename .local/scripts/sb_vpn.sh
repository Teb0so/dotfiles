#!/usr/bin/bash

VPN_NAME="nl-free-79"

if nmcli -t -f NAME connection show --active | grep -q "^$VPN_NAME$"; then
    printf "「VPN - nl-free-79」"
else
    printf "「VPN - disconnected」"
fi
