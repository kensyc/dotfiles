# ZSH CONFIGURATION
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ${ZDOTDIR}/partials/config.zsh
source ${ZDOTDIR}/partials/keybinds.zsh
source ${ZDOTDIR}/partials/plugins.zsh
source ${ZDOTDIR}/partials/theme.zsh
source ${ZDOTDIR}/partials/alias.zsh

# AUTOCOMPLETE
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

[[ ! -f ${ZDOTDIR}/.p10k.zsh ]] || source ${ZDOTDIR}/.p10k.zsh
