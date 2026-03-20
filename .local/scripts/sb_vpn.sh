#!/usr/bin/env bash

VPN_NAME="nl-free-79"

if nmcli -t -f NAME connection show --active | grep -q "^$VPN_NAME$"; then
    echo '{"text":" VPN","class":"connected"}'
else
    echo '{"text":" VPN","class":"disconnected"}'
fi
