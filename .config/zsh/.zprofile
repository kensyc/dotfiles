# if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
if [[ -z $DISPLAY && $(tty) == /dev/tty1 ]]; then
    case $DESKTOP_ENVIRONMENT in
        bspwm)
            exec startx $HOME/.config/X11/.xinitrc -- -keeptty &> ~/.xorg.log
            ;;

        hyprland)
            Hyprland
            ;;
    esac
fi

