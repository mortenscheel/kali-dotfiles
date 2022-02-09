#!/usr/bin/env bash

is-missing() {
	command -v "$1" >/dev/null && return 1 || return 0
}
confirm() {
	read -p "$* " prompt
	[[ "$prompt" =~ [Yy]$ ]]
}

if ! timedatectl | grep -q "Copenhagen" && confirm Set timezone to Europe/Copenhagen?; then
	sudo timedatectl set-timezone Europe/Copenhagen
fi

if ! locale -a | grep -q da_DK && confirm Install Danish locales?; then
	sudo sed -E -i 's/# (da|en)_DK/\1_DK/g' /etc/locale.gen
	sudo locale-gen
fi

confirm Run apt update? && sudo apt update

if is-missing subl && confirm Install Sublime?; then
	# Sublime Text
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt update
	sudo apt install sublime-text
fi
if is-missing code && confirm Install Visual Studio Code?; then
	curl -L https://update.code.visualstudio.com/latest/linux-deb-x64/stable > /tmp/code.deb && \
	sudo apt install /tmp/code.deb && \
	rm /tmp/code.deb
fi
if is-missing docker && confirm Install Docker?; then
	sudo apt install -y curl gnupg2 apt-transport-https software-properties-common ca-certificates
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
	echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" | sudo tee /etc/apt/sources.list.d/docker.list
	sudo apt update
	sudo apt install -y docker-ce docker-ce-cli containerd.io
	sudo usermod -aG docker $USER
	newgrp docker
fi

if is-missing brew && confirm Install brew?; then
	# Homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
	test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if ! is-missing brew && [ ! -f /home/linuxbrew/.linuxbrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
	brew install zsh-history-substring-search
fi

if ! is-missing brew && is-missing gh && confirm Install gh?; then
	brew install gh
fi

if is-missing pwncat && confirm Install pwncat?; then
	sudo apt install -y python3-venv && \
	sudo python3 -m venv /opt/pwncat && \
	sudo /opt/pwncat/bin/pip install git+https://github.com/calebstewart/pwncat && \
	sudo ln -s /opt/pwncat/bin/pwncat-cs /usr/local/bin/pwncat
fi

for apt_bin in gobuster seclists; do
	if is-missing $apt_bin && confirm Install $apt_bin?; then
		sudo apt install -y $apt_bin
	fi
done

is-missing tldr && sudo apt install -y tldr && tldr --update

if [ ! -f /usr/share/wordlists/rockyou.txt ]; then
	sudo gzip -d /usr/share/wordlists/rockyou.txt.gz
fi
