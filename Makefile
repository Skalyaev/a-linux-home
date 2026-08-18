SHELL:=/bin/bash

SRC=$(PWD)/home
DST=$(HOME)

NEOVIM_REPO=git@github.com:Skalyaev/a-terminal-based-ide.git

.PHONY: all apt shared bash readline git python node neovim \
	remove \
	remove-apt \
	remove-shared \
	remove-bash \
	remove-readline \
	remove-git \
	remove-python \
	remove-node \
	remove-neovim \
	re \
	re-apt \
	re-shared \
	re-bash \
	re-readline \
	re-git \
	re-python \
	re-node \
	re-neovim

all: apt shared bash readline git python node neovim

apt:
	sudo apt update && \
	DEBIAN_FRONTEND=noninteractive \
		sudo apt install -y lolcat figlet nodejs npm

shared:
	mkdir -p $(DST)/.local/share
	ln -sf $(SRC)/.local/share/figlet $(DST)/.local/share

bash:
	mkdir -p $(DST)/.history
	ln -sf $(SRC)/.profile $(DST)/.profile
	ln -sf $(SRC)/.bashrc $(DST)/.bashrc
	ln -sf $(SRC)/.bash_env $(DST)/.bash_env
	ln -sf $(SRC)/.bash_aliases $(DST)/.bash_aliases
	ln -sf $(SRC)/.bash_welcome $(DST)/.bash_welcome
	ln -sf $(SRC)/.bash_logout $(DST)/.bash_logout

readline:
	mkdir -p $(DST)/.config
	ln -sf $(SRC)/.config/.inputrc $(DST)/.config/.inputrc

git:
	mkdir -p $(DST)/.config
	ln -sf $(SRC)/.config/.gitconfig $(DST)/.config/.gitconfig

python:
	mkdir -p $(DST)/.config
	ln -sf $(SRC)/.config/.pythonrc $(DST)/.config/.pythonrc
	rm -rf $(DST)/.python_history

node:
	npm config set cache ~/.cache/npm --global
	mv ~/.npm ~/.cache/npm

neovim:
	if [ -e $(DST)/.local/src/neovim ]; then \
		$(MAKE) remove-neovim; \
	fi
	mkdir -p $(DST)/.local/src
	git clone $(NEOVIM_REPO) $(DST)/.local/src/neovim
	cd $(DST)/.local/src/neovim && make

remove: remove-apt \
	remove-shared \
	remove-bash \
	remove-readline \
	remove-git \
	remove-python \
	remove-node \
	remove-neovim

remove-apt:
	sudo apt update
	sudo apt remove -y lolcat figlet

remove-shared:
	rm -rf $(DST)/.local/share/figlet

remove-bash:
	rm -rf $(DST)/.profile
	rm -rf $(DST)/.bashrc
	rm -rf $(DST)/.bash_env
	rm -rf $(DST)/.bash_aliases
	rm -rf $(DST)/.bash_welcome
	rm -rf $(DST)/.bash_logout

remove-readline:
	rm -rf $(DST)/.config/.inputrc

remove-git:
	rm -rf $(DST)/.config/.gitconfig

remove-python:
	rm -rf $(DST)/.config/.pythonrc
	rm -rf $(DST)/.python_history

remove-neovim:
	cd $(DST)/.local/src/neovim && make uninstall
	rm -rf $(DST)/.local/src/neovim
	echo -e "\r[$(GREEN) OK $(RST)] Neovim config removed"

remove-node:
	echo -n "Removing node config..."
	rm -rf $(DST)/.cache/npm
	echo -e "\r[$(GREEN) OK $(RST)] Node config removed"

re: remove all

re-apt: remove-apt apt

re-shared: remove-shared shared

re-bash: remove-bash bash

re-readline: remove-readline readline

re-git: remove-git git

re-python: remove-python python

re-node: remove-node node

re-neovim: remove-neovim neovim
