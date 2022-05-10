function source-compiled() {
  # If there is no *.zsh.zwc or it's older than *.zsh, compile *.zsh into *.zsh.zwc.
  if [[ ! "$1".zwc -nt "$1" ]]; then
    zcompile "$1"
  fi
  source "$1"
}

source-compiled $ZDOTDIR/plugins/zsh-defer/zsh-defer.plugin.zsh

zsh-defer source-compiled $ZDOTDIR/plugins/zsh-completions/zsh-completions.plugin.zsh
zsh-defer source-compiled $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
zsh-defer source-compiled $ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
zsh-defer source-compiled $ZDOTDIR/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

