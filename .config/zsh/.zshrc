source ${ZDOTDIR}/themes/${ZTHEME}/pre-zshrc.zsh

# ZSH CONFIGURATION
source ${ZDOTDIR}/partials/config.zsh
source ${ZDOTDIR}/partials/keybinds.zsh
source ${ZDOTDIR}/partials/plugins.zsh
source ${ZDOTDIR}/partials/alias.zsh

# case $XDG_SESSION_TYPE in
#     wayland)
#         source ${ZDOTDIR}/partials/wayland.zsh
#         ;;
# esac

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
source ${ZDOTDIR}/partials/fzf-git.sh
source ${ZDOTDIR}/partials/fzf-git-branches.sh
source ${ZDOTDIR}/partials/fzf-git-commits.sh
source ${ZDOTDIR}/partials/fzf-git-files.sh
source ${ZDOTDIR}/partials/fzf-docker.zsh
source ${ZDOTDIR}/partials/systemd.sh

compdef run=docker

# Bun completions
[ -s "~/.bun/_bun" ] && source "~/.bun/_bun"

# Direnv
eval "$(direnv hook zsh)"

# Zoxide
eval "$(zoxide init zsh)"

source ${ZDOTDIR}/themes/${ZTHEME}/post-zshrc.zsh

