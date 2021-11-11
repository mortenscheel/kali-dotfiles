#!/usr/bin/env bash

is-missing() {
	command -v "$1" >/dev/null && return 1 || return 0
}

if ! timedatectl | grep -q "Copenhagen"; then
	sudo timedatectl set-timezone Europe/Copenhagen
fi

if ! locale -a | grep -q da_DK; then
	sudo sed -E -i 's/# (da|en)_DK/\1_DK/g' /etc/locale.gen
	sudo locale-gen
fi

sudo apt update

if is-missing subl; then
	# Sublime Text
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt update
	sudo apt install sublime-text
fi
if is-missing docker; then
	sudo apt install -y curl gnupg2 apt-transport-https software-properties-common ca-certificates
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
	echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" | sudo tee /etc/apt/sources.list.d/docker.list
	sudo apt update
	sudo apt install -y docker-ce docker-ce-cli containerd.io
	sudo usermod -aG docker $USER
	newgrp docker
fi

if is-missing brew; then
	# Homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
	test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if [ ! -f /home/linuxbrew/.linuxbrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
	brew install zsh-history-substring-search
fi

if is-missing gh; then
	brew install gh
fi

if is-missing pwncat; then
	sudo apt install python3-venv
	sudo python3 -m venv /opt/pwncat
	sudo /opt/pwncat/bin/pip install git+https://github.com/calebstewart/pwncat
	sudo ln -s /opt/pwncat/bin/pwncat /usr/local/bin
fi

for apt_bin in terminator gobuster tldr steghide; do
	if is-missing $apt_bin; then
		sudo apt install $apt_bin
	fi
done
