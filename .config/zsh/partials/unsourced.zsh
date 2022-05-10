# Config currently not used but interesting
# -------------------------------------------------------------------------------------------------------
# USE` dirs -v` TO SEE DIRECTORY HISTORY. USE `cd -<NUM>` TO GO THE DIRECTORY
chpwd_dirstack() {
    print -l -- "$PWD" "${(u)dirstack[@]}" > "$DIRSTACKFILE"
}

autoload -Uz add-zsh-hook
add-zsh-hook -Uz chpwd chpwd_dirstack

DIRSTACKFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/dirs"
DIRSTACKSIZE='20'

if [[ -f "$DIRSTACKFILE" ]] && (( ${#dirstack} == 0 )); then
    dirstack=("${(@f)"$(< "$DIRSTACKFILE")"}")
    [[ -d "${dirstack[1]}" ]] && cd -- "${dirstack[1]}"
fi

setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME
setopt PUSHD_IGNORE_DUPS						# Remove duplicate entries
setopt PUSHD_MINUS							# This reverts the +/- operators.
# -------------------------------------------------------------------------------------------------------
