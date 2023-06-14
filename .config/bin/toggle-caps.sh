#!/usr/bin/env bash

if setxkbmap -query | grep -q caps:escape; then
    /usr/bin/setxkbmap -option
else
    /usr/bin/setxkbmap -option caps:escape
fi

