#!/bin/bash

read -r -a monitors <<< "$(xrandr -q | grep '\bconnected' | awk 'ORS=" " {print $1}')"

if [[ ${monitors[0]} != "eDP-1" ]]; then
    echo "eDP-1 is not the first element"

    exit 1
fi

xrandr --output "${monitors[0]}" --primary --mode 1920x1080 --pos 0x0 --rotate normal --output "${monitors[1]}" --mode 1920x1080 --pos 0x0 --rotate normal --same-as "${monitors[0]}"

bspc wm -O "${monitors[@]}"
