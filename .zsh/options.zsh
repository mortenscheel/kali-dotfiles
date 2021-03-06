# Don't remove trailing slash after completing folder name
setopt no_auto_remove_slash
ZLE_REMOVE_SUFFIX_CHARS=""

setopt HIST_IGNORE_ALL_DUPS

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

[ -z $EDITOR ] && export EDITOR=nano
export GENCOMPL_FPATH="$HOME/.zsh/completions"
zstyle :plugin:zsh-completion-generator programs fd