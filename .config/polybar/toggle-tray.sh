#!/usr/bin/env bash

tray=$(xprop -name "polybar-tray" _NET_WM_PID | grep -o '[[:digit:]]*')

if [[ $tray =~ [0-9]+ ]]
then
    # Toggle visibility on the bar
    polybar-msg -p $tray cmd toggle
else
    # Launch bar
    echo "---" | tee -a /tmp/polybar-tray.log
    polybar tray >>/tmp/polybar-tray.log 2>&1 & disown
fi
