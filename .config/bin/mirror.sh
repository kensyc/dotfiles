#!/bin/bash

common_resolution=$(xrandr -q | grep -vE 't' | awk 'a[$1]++{print $1}' | sed -n 1p)
read -r -a monitors <<< "$(xrandr -q | grep '\bconnected' | awk 'ORS=" " {print $1}')"

if [[ ${monitors[0]} != "eDP-1" ]]; then
    echo "eDP-1 is not the first element"

    exit 1
fi

xrandr --output "${monitors[0]}" --primary --mode "$common_resolution" --pos 0x0 --rotate normal --output "${monitors[1]}" --mode "$common_resolution" --pos 0x0 --rotate normal --same-as "${monitors[0]}"

bspc wm -r
sleep 10
bspc desktop Desktop --remove
