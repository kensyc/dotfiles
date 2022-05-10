# KEYBINDS
bindkey -v							# VI mode

bindkey -M viins '^[i' vi-cmd-mode				# use jk keysequence to go to normal mode
bindkey -M vicmd 'k'  history-substring-search-up		# pressing up   will only go through commands matching current line
bindkey -M vicmd 'j'  history-substring-search-down		# pressing down will only go through commands matching current line

bindkey '^[[A' history-substring-search-up			# pressing up   will only go through commands matching current line
bindkey '^[[B' history-substring-search-down			# pressing down will only go through commands matching current line
bindkey '^?' backward-delete-char 				# fix backspace after going from normal mode to insert mode
