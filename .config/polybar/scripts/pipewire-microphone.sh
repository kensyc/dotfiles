#!/bin/sh

is_mic_muted() {
    pactl get-source-mute @DEFAULT_SOURCE@ | sed s/Mute:\ //
}

get_mic_status() {
    is_muted="$(is_mic_muted)"

    if [ "${is_muted}" = "yes" ]; then
      echo "%{F$(polybar --dump=foreground-inactive main)}%{F-}"
    else
      echo ""
    fi
}

listen() {
    get_mic_status

    LANG=EN; pactl subscribe | while read -r event; do
        if printf "%s\n" "${event}" | grep --quiet "source" || printf "%s\n" "${event}" | grep --quiet "server"; then
            get_mic_status
        fi
    done
}

toggle() {
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
}

case "$1" in
    --toggle)
        toggle
        ;;
    *)
        listen
        ;;
esac
