# Execute startup command (which will start the window manager)
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx $XINITRC -- -keeptty &> ~/.xorg.log
fi
