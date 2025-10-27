FZF_DOCKER_PS_FORMAT="table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Image}}\t{{.Ports}}"
FZF_DOCKER_IMAGES_FORMAT="table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}\t{{.CreatedSince}}"

_fzf_complete_docker() {
  ARGS="$@"
  if [[ $ARGS == 'docker tag'* || $ARGS == 'docker -f'* || $ARGS == 'docker run'* || $ARGS == 'docker push'* || $ARGS == 'docker rmi'* ]]; then
    _fzf_complete "--multi --header-lines=1" "$@" < <(
      docker images --format "${FZF_DOCKER_IMAGES_FORMAT}"
    )
  elif [[ $ARGS == 'docker stop'* || $ARGS == 'docker exec'* || $ARGS == 'docker kill'* || $ARGS == 'docker restart'* ]]; then
    _fzf_complete "--multi --header-lines=1 " "$@" < <(
      docker ps --format "${FZF_DOCKER_PS_FORMAT}"
    )  
  elif [[ $ARGS == 'docker logs'* ]]; then
    _fzf_complete "--multi --header-lines=1 --header 'Enter CTRL-O to open log in editor' --bind \"ctrl-o:execute:docker logs {1} | sed 's/\x1b\[[0-9;]*m//g' | cat | ${EDITOR:-vim} -\" --preview-window up:follow --preview 'docker logs --follow --tail=100 {1}' " "$@" < <(
      docker ps -a --format "${FZF_DOCKER_PS_FORMAT}"
    )
  elif [[ $ARGS == 'docker rm'* || $ARGS == 'docker start'* ]]; then
    _fzf_complete "--multi --header-lines=1 " "$@" < <(
      docker ps -a --format "${FZF_DOCKER_PS_FORMAT}"
  )
  fi
}

_fzf_complete_docker_post() {
  # Post-process the fzf output to keep only the command name and not the explanation with it
  awk '{print $1}'
}

_fzf_complete_run() {
  ARGS="$@"
  if [[ $ARGS == 'run run'* ]]; then
    _fzf_complete "--multi --header-lines=1" "$@" < <(run images)
  elif [[ $ARGS == 'run stop'* || $ARGS == 'run exec'* || $ARGS == 'run kill'* || $ARGS == 'run restart'* ]]; then
    _fzf_complete "--multi --header-lines=1 " "$@" < <(run ps)
  elif [[ $ARGS == 'run logs'* ]]; then
    _fzf_complete "--multi --header-lines=1 --header 'Enter CTRL-O to open log' --bind \"ctrl-o:become(dl {4})\" --preview-window up:follow --preview 'run logs --follow --tail=100 {4}' " "$@" < <(
      run ps -a
    )
  elif [[ $ARGS == 'run rm'* || $ARGS == 'run start'* ]]; then
    _fzf_complete "--multi --header-lines=1 " "$@" < <(run ps -a)
  fi
}

_fzf_complete_run_post() {
  # Post-process the fzf output to keep only the command name and not the explanation with it
  awk '{print $1}'
}

[ -n "$BASH" ] && complete -F _fzf_complete_docker -o default -o bashdefault docker
[ -n "$BASH" ] && complete -F _fzf_complete_run -o default -o bashdefault run
