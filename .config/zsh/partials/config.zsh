# HISTORY
HISTFILE=~/.cache/zsh/.histfile				# Path to file in which history is saved
HISTSIZE=1000						# Approximate size of history available in shell
SAVEHIST=10000						# Approximate size of history available in the history file

# ZSH OPTIONS SET THROUGH THE INSTALL WIZARD
setopt appendhistory					# On new zsh sessions, append history to history file instead of replacing it
setopt nomatch						# If a pattern for filename generation has no matches, print an error, instead of leaving it unchanged in the argument list
setopt notify						# Report the status of background jobs immediately, rather than waiting until just before printing a prompt

unsetopt autocd						# If a command cannot be executed, and the command is the name of a directory, perform a cd to that directory
unsetopt beep						# Unset the beep on error
unsetopt extendedglob					# Unset characters #, ~ and ^ as part of patterns for filename generation
