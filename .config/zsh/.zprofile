# Execute startup command (which will start the window manager)
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    if [[ $XDG_SESSION_TYPE == "x11" ]]; then
        exec startx $XINITRC -- -keeptty &> ~/.xorg.log
    fi
    if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
        exec dbus-run-session $WINDOW_MANAGER
    fi
fi
