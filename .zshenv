#!/bin/zsh

# default programs
export BROWSER="firefox"
export EDITOR="nvim"
export FMANAGER="ranger"
export ZTHEME="spaceship"

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

# NPM
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/.npmrc"
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"

# Screensaver
source $HOME/.config/xsecurelock/config.sh

export KEYTIMEOUT=1
export PATH="$HOME/.config/bin:$HOME/.local/bin:$HOME/.local/share/npm/bin:$PATH"
