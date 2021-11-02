#!/usr/bin/env bash

is-missing() {
	command -v "$1" >/dev/null && return 1 || return 0
}

if ! timedatectl | grep -q "Copenhagen"; then
	sudo timedatectl set-timezone Europe/Copenhagen
fi

if ! locale -a | grep -q da_DK; then
	sudo sed -i 's/# da_DK/da_DK/g' /etc/locale.gen
	sudo locale-gen
fi

sudo apt update

if is-missing subl; then
	# Sublime Text
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt update
	apt install sublime-text
fi

if is-missing brew; then
	# Homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ ! -f /home/linuxbrew/.linuxbrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
	brew install zsh-history-substring-search
fi

if is-missing gh; then
	brew install gh
fi

for apt_bin in terminator; do
	if is-missing $apt_bin; then
		sudo apt install $apt_bin
	fi
done
