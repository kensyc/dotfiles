#!/usr/bin/env bash

if [ -z $@ ]; then
    echo -n "$(ls $DEV_TOOLS_CACHE_DIR)"

    exit 0
else
    exec $(kitty)
fi
