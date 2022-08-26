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
alias yac="yadm add -u && yadm commit && yadm push"
alias src="zimfw clean -q && zimfw build -q && zimfw compile -q && exec $(which zsh)"
alias rustscan="rustscan --ulimit 5000 -a"
getip(){
	iface="${1:-eth0}"
	ip="$(ip -4 addr show $iface | grep -oP '(?<=inet\s)\d+(\.\d+){3}')"
	echo "$iface: $ip"
	printf "%s" "$ip" | xclip -sel clip
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
update_linpeas() {
	location=/opt/linpeas.sh
	sudo rm $location
	sudo wget -q --output-document=$location https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh
	sudo chmod +x $location
}
alias ..='cd ..'
alias ...='cd ../..'
alias ssp=searchsploit

# Docker
alias dps="docker ps"
alias dc="docker-compose"
alias dcr="docker run --rm -it"
alias dce="docker-compose exec"

# tools
alias nmap-scan="sudo nmap -sV -Pn -sS -A -O -vv -T4"
alias dirscan-md="gobuster dir -w $dirlist_md -u"
alias dirscan-sm="gobuster dir -w $common -u"
alias vhost-scan="gobuster vhost -r -w $seclists/Discovery/DNS/subdomains-top1million-5000.txt -u"