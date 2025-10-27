#!/usr/bin/env bash

function get_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -o '[0-9.]*' | sed 's/0.//g'
}

function update_label() {
    if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q 'MUTED'; then
        echo "%{F#575268}%{F-}"
    else
        vol=$(get_volume)
        echo " $vol%"
    fi
}

update_label

while [ "$1" != "" ]; do
    case $1 in
    -i | --increase)
        wpctl set-volume -l 1 @DEFAULT_AUDIO_SOURCE@ 5%+
        wpctl get-volume @DEFAULT_AUDIO_SOURCE@

        exit 0
        ;;
    -d | --decrease)
        wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%-
        wpctl get-volume @DEFAULT_AUDIO_SOURCE@

        exit 0
        ;;
    -t | --toggle-mute)
        wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

        update_label

        exit 0
        ;;
    *)
        exit 0
        ;;
    esac
done
