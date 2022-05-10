#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch bar
echo "---" | tee -a /tmp/polybar-main.log
polybar main >>/tmp/polybar-main.log 2>&1 & disown
polybar tray >>/tmp/polybar-tray.log 2>&1 & disown

tray=$(echo $!)

xdo id -m -a polybar-tray && polybar-msg -p $tray cmd hide

echo "Bars launched..."
