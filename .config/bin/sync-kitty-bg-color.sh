#!/usr/bin/env bash

bgcolor=$(nvim --headless -c "hi Normal" -c q 2>&1 | grep -o 'guibg=.*' | awk -F '=' '{print $2}' | tr '[:lower:]' '[:upper:]')

sed -i -E "s/^(background\W*)#.*/\1$bgcolor/g" $COLORSCHEMES/current/colors-kitty.conf
