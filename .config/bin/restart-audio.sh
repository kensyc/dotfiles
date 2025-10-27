#!/bin/bash

systemctl --user restart wireplumber pipewire pipewire-pulse

pactl load-module module-switch-on-connect
