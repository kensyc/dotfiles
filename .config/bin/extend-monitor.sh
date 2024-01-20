#!/bin/bash

read -r -a resolutions <<< "$(xrandr -q | grep '\bconnected' --no-group-separator -A 1 | grep -vE "DP|HDMI" | awk 'ORS=" " {print $1}')"
read -r -a monitors <<< "$(xrandr -q | grep '\bconnected' | awk 'ORS=" " {print $1}')"

if [[ ${monitors[0]} != "eDP-1" ]]; then
    echo "eDP-1 is not the first element"

    exit 1
fi

xrandr --output "${monitors[1]}" --right-of "eDP-1" --mode "${resolutions[1]}" --pos 0x0 --rotate normal

bspc wm -O "${monitors[@]}"
