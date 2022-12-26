#!/usr/bin/env bash

if [ -z $@ ]; then
    echo -n "$(ls $DEV_TOOLS_CACHE_DIR)"
else

    exec kitty $HOME/.config/bin/startenv "$@" >& /dev/null
    # append to .xorg.log
    # >> ~/.xorg.log 2>&1
fi

exit 0

