#!/usr/bin/env bash

result=$XDG_CONFIG_HOME/gnome-settings

if [[ $1 == get ]]; then
    :>"$result"

    schemas=$(gsettings list-schemas | grep -E "extension|keybind")

    for schema in $schemas; do
        keys=$(gsettings list-keys "$schema")

        for key in $keys; do
            echo "gsettings set $schema $key \"$(gsettings get "$schema" "$key")\"" >> "$result"
        done
    done

    echo "gsettings set org.gnome.desktop.input-sources xkb-options \"['caps:swapescape']\"" >> "$result"

    exit 0
fi

if [[ $1 == set ]]; then
    while read  -r line; do
        eval "${line}"
    done <"$result"

    exit 0
fi

echo "Usage: gnome-settings [get|set]"
