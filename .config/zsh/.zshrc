source ${ZDOTDIR}/themes/${ZTHEME}/pre-zshrc.zsh

# ZSH CONFIGURATION
source ${ZDOTDIR}/partials/config.zsh
source ${ZDOTDIR}/partials/keybinds.zsh
source ${ZDOTDIR}/partials/plugins.zsh
source ${ZDOTDIR}/partials/alias.zsh

# Add custom autocompletions
fpath=(${ZDOTDIR}/autocomplete $fpath)

# AUTOCOMPLETE
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'r:|?=**'
compinit

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source ${COLORSCHEMES}/current/colors-fzf.sh


source ${ZDOTDIR}/themes/${ZTHEME}/post-zshrc.zsh
