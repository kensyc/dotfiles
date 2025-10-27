# KEYBINDS
bindkey -v							                    # VI mode

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

bindkey -M viins '^[i' vi-cmd-mode				        # go into insert mode
bindkey -M vicmd 'k'  up-line-or-beginning-search		# pressing up   will only go through commands matching current line
bindkey -M vicmd 'j'  down-line-or-beginning-search		# pressing down will only go through commands matching current line

bindkey '^?' backward-delete-char 				        # fix backspace after going from normal mode to insert mode

