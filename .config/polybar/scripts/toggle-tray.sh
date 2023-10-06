#!/usr/bin/env bash

tray=$(xprop -name "polybar-tray" _NET_WM_PID | grep -o '[[:digit:]]*')
main=$(xrandr -q | grep " connected primary" | cut -d ' ' -f1)
side=$(xrandr -q | grep " connected [^primary]" | cut -d ' ' -f1)

if [[ $tray =~ [0-9]+ ]]
then
    # Toggle visibility on the bar
    polybar-msg -p $tray cmd toggle
else
    # Launch bar
    echo "---" | tee -a /tmp/polybar-tray.log
    MONITOR_MAIN="$main" MONITOR_SIDE="$side" polybar tray >>/tmp/polybar-tray.log 2>&1 & disown
fi
