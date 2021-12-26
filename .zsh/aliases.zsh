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
alias src="exec $SHELL"

getip(){
	iface="${1:-eth0}"
	ip="$(ip -4 addr show $iface | grep -oP '(?<=inet\s)\d+(\.\d+){3}')"
	echo "$iface: $ip"
	echo "$ip" | xclip -sel clip
}