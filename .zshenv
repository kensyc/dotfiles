#!/bin/zsh

# Desktop environment
# export DESKTOP_ENVIRONMENT="bspwm"
export DESKTOP_ENVIRONMENT="hyprland"

if [[ $DESKTOP_ENVIRONMENT = "bspwm" ]]; then
    export XDG_SESSION_TYPE="x11"
    export XINITRC="$HOME/.config/X11/.xinitrc"
    export XAUTHORITY="$HOME/.config/X11/.Xauthority"
fi

if [[ $DESKTOP_ENVIRONMENT = "hyprland" ]]; then
    export MOZ_ENABLE_WAYLAND=1
    export ELECTRON_OZONE_PLATFORM_HINT=wayland
fi

# default programs
export BROWSER="firefox"
export EDITOR="nvim"
export FMANAGER="ranger"
export ZTHEME="starship"
export TERMINAL="kitty"

# default directories
export ZDOTDIR="$HOME/.config/zsh"
export COLORSCHEMES="$HOME/.config/colorschemes"
export WALLPAPERS="$HOME/.wallpaper"

# XDG specs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# GO
export GOPATH="$XDG_DATA_HOME"/go

# Java
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_DATA_HOME/java"

# FZF
export FZF_COMPLETION_TRIGGER=','

# NPM
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/.npmrc"
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"

export DOCKER_CONFIG="$XDG_DATA_HOME/docker"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export MOZILLA_CONFIG="$XDG_DATA_HOME/mozilla"

export KEYTIMEOUT=20
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
export PATH="$HOME/.config/bin:$HOME/work/bin:$HOME/.config/dev-tools/bin:$HOME/.config/dev-tools:$HOME/.local/bin:$HOME/.local/share/npm/bin:$PATH"
export LIBVA_DRIVER_NAME="iHD"
export ANV_VIDEO_DECODE=1
