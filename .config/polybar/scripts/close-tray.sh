#!/usr/bin/env bash

kill -9 $(xprop -name "polybar-tray" _NET_WM_PID | grep -o '[[:digit:]]*')
