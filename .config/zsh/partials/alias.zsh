alias vim='/usr/bin/nvim'
alias ovim='/usr/bin/vim'
alias l='ls -lah'
alias rm='rm -i'
alias diff='kitty +kitten diff'
alias hosts='sudo vim /etc/hosts'
alias sshconfig='vim $HOME/.ssh/config'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias kssh='kitty +kitten ssh'
alias mysql-workbench='mysql-workbench --configdir=$XDG_DATA_HOME/mysql/workbench'
alias start='startenv -d $HOME/.config/dev-tools/defaults/dockerwest'
alias git difftool='git difftool --no-symlinks --dir-diff'

function config() {
    source $HOME/.hiddenenv_home

    /usr/bin/git --git-dir=$HOME/.repository/ --work-tree=$HOME "$@"

    source $HOME/.hiddenenv_work
}
