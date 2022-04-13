#!/usr/bin/env zsh

mkcd() {
	mkdir -p "$1"
	cd "$1"
}
addalias() {
	[ $# -ne 2 ] && echo "2 arguments required" && return 1
	printf 'alias %s="%s"\n' $1 $2 >>~/.zsh/aliases.zsh
	source ~/.zsh/aliases.zsh
}
alias ys="yadm status"
alias rustscan='docker run -it --rm --name rustscan rustscan/rustscan:1.10.0'
alias yac="yadm add -u && yadm commit && yadm push"
alias src="zimfw clean -q && zimfw compile -q && exec $(which zsh)"

getip(){
	iface="${1:-eth0}"
	ip="$(ip -4 addr show $iface | grep -oP '(?<=inet\s)\d+(\.\d+){3}')"
	echo "$iface: $ip"
	echo "$ip" | xclip -sel clip
}
alias gs="git status"
alias gl="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gadd="git add ."
alias co="git checkout"
alias gfa="git fetch --all"
alias gcm="git commit -m "
alias gac='git add . && git commit -m'
alias nah="git reset --hard && git clean -df"

alias pwncat=pwncat-cs
alias zshedit='code $HOME/.zshrc $HOME/.zimrc $HOME/.zsh'