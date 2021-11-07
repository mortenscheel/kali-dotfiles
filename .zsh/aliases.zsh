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
