export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export LC_TIME="da_DK.UTF8"
fpath+=("$HOME/.zsh/completion")

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
