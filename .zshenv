#!/bin/zsh

# Desktop environment


# Gnome on X11
export WINDOW_MANAGER="gnome-session"
export XDG_SESSION_TYPE="x11"
export GDK_BACKEND="x11"

# Gnome on wayland
# export WINDOW_MANAGER="gnome-session"
# export MOZ_ENABLE_WAYLAND=1
# export QT_QPA_PLATORM="wayland"
# export XDG_SESSION_TYPE="wayland"

# bspwm
# export WINDOW_MANAGER="bspwm"
# export XDG_SESSION_TYPE="x11"

# default programs
export BROWSER="firefox"
export EDITOR="nvim"
export FMANAGER="ranger"
export ZTHEME="starship"
export TERMINAL="kitty"

# default directories
export XINITRC="$HOME/.config/X11/.xinitrc"
export XAUTHORITY="$HOME/.config/X11/.Xauthority"
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

# NPM
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/.npmrc"
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"

export DOCKER_CONFIG="$XDG_DATA_HOME/docker"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export MOZILLA_CONFIG="$XDG_DATA_HOME/mozilla"

# Dev tools
export DEV_TOOLS_PROJECTS_DIR="$HOME/projects"
export DEV_TOOLS_CACHE_DIR="$XDG_CACHE_HOME/docker-environments"
export DEV_TOOLS_VERBOSE=1

# Screensaver
source $HOME/.config/xsecurelock/config.sh

export KEYTIMEOUT=1
#export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/keyring/ssh"
export PATH="$HOME/.config/bin:$HOME/.local/bin:$HOME/.local/share/npm/bin:$PATH"
export GTK_THEME="Catppuccin-Mocha-Standard-Flamingo-Dark"

# export environment variables which should not be committed
source $HOME/.hiddenenv_work
