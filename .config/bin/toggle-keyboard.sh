#!/usr/bin/env bash

if setxkbmap -query | grep -q alt-intl; then
    setxkbmap us
else
    setxkbmap us -variant alt-intl
fi

