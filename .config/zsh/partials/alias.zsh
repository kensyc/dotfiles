alias vim='/usr/bin/nvim'
alias ovim='/usr/bin/vim'
alias l='ls -lah'
alias rm='rm -i'
alias diff='kitty +kitten diff'
alias hosts='sudo vim /etc/hosts'
alias sshconfig='vim $HOME/.ssh/config'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias kssh='kitty +kitten ssh'
alias gdiff='git difftool --no-symlinks --dir-diff'
alias ranger='ranger --choosedir=$XDG_CONFIG_HOME/ranger/.rangerdir; LASTDIR=`cat $XDG_CONFIG_HOME/ranger/.rangerdir`; cd "$LASTDIR"'
alias config='/usr/bin/git --git-dir=$HOME/.repository/ --work-tree=$HOME "$@"'

function create-envrc() {
    touch .envrc

    if [ -f compose.yaml ]; then
        echo "export COMPOSE_FILE=$(readlink -f compose.yaml)" >> .envrc
    fi

    if [ -f compose.yml ]; then
        echo "export COMPOSE_FILE=$(readlink -f compose.yml)" >> .envrc
    fi

    if [ -f docker-compose.yaml ]; then
        echo "export COMPOSE_FILE=$(readlink -f docker-compose.yaml)" >> .envrc
    fi

    if [ -f docker-compose.yml ]; then
        echo "export COMPOSE_FILE=$(readlink -f docker-compose.yml)" >> .envrc
    fi

    direnv allow
}
