SHELL:=/bin/bash

SRC=$(PWD)/home
DST=$(HOME)

NEOVIM_REPO=git@github.com:Skalyaev/a-terminal-based-ide.git

GREEN=\033[0;32m
RST=\033[0m

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
	@sudo apt update &>/dev/null
	@echo -n "Installing packages..."
	@sudo apt install -y lolcat &>/dev/null
	@sudo apt install -y figlet &>/dev/null
	@sudo apt install -y nodejs &>/dev/null
	@sudo apt install -y npm &>/dev/null
	@echo -e "\r[$(GREEN) OK $(RST)] Packages installed"

shared:
	@echo -n "Linking shared files..."
	@mkdir -p $(DST)/.local/share
	@ln -sf $(SRC)/.local/share/figlet $(DST)/.local/share
	@echo -e "\r[$(GREEN) OK $(RST)] Shared files linked"

bash:
	@echo -n "Linking bash config..."
	@mkdir -p $(DST)/.history
	@ln -sf $(SRC)/.profile $(DST)/.profile
	@ln -sf $(SRC)/.bashrc $(DST)/.bashrc
	@ln -sf $(SRC)/.bash_env $(DST)/.bash_env
	@ln -sf $(SRC)/.bash_aliases $(DST)/.bash_aliases
	@ln -sf $(SRC)/.bash_welcome $(DST)/.bash_welcome
	@ln -sf $(SRC)/.bash_logout $(DST)/.bash_logout
	@echo -e "\r[$(GREEN) OK $(RST)] Bash config linked"

readline:
	@echo -n "Linking readline config..."
	@mkdir -p $(DST)/.config
	@ln -sf $(SRC)/.config/.inputrc $(DST)/.config/.inputrc
	@echo -e "\r[$(GREEN) OK $(RST)] Readline config linked"

git:
	@echo -n "Linking git config..."
	@mkdir -p $(DST)/.config
	@ln -sf $(SRC)/.config/.gitconfig $(DST)/.config/.gitconfig
	@echo -e "\r[$(GREEN) OK $(RST)] Git config linked"

python:
	@echo -n "Linking python config..."
	@mkdir -p $(DST)/.config
	@ln -sf $(SRC)/.config/.pythonrc $(DST)/.config/.pythonrc
	@echo exit | python
	@rm -rf $(DST)/.python_history
	@echo -e "\r[$(GREEN) OK $(RST)] Python config linked"

node:
	@echo -n "Configuring node..."
	@npm config set cache ~/.cache/npm --global
	@mv ~/.npm ~/.cache/npm
	@echo -e "\r[$(GREEN) OK $(RST)] Node configured"

neovim:
	@if [ -e $(DST)/.local/src/neovim ]; then \
		$(MAKE) remove-neovim; \
	fi
	@echo -n "Installing neovim config..."
	@mkdir -p $(DST)/.local/src
	@git clone $(NEOVIM_REPO) $(DST)/.local/src/neovim &>/dev/null
	@cd $(DST)/.local/src/neovim && make &>/dev/null
	@echo -e "\r[$(GREEN) OK $(RST)] Neovim config installed"

remove: remove-apt \
	remove-shared \
	remove-bash \
	remove-readline \
	remove-git \
	remove-python \
	remove-node \
	remove-neovim

remove-apt:
	@sudo apt update &>/dev/null
	@echo -n "Removing packages..."
	@sudo apt remove -y lolcat figlet &>/dev/null
	@echo -e "\r[$(GREEN) OK $(RST)] Packages removed"

remove-shared:
	@echo -n "Removing shared files..."
	@rm -rf $(DST)/.local/share/figlet
	@echo -e "\r[$(GREEN) OK $(RST)] Shared files removed"

remove-bash:
	@echo -n "Removing bash config..."
	@rm -rf $(DST)/.profile
	@rm -rf $(DST)/.bashrc
	@rm -rf $(DST)/.bash_env
	@rm -rf $(DST)/.bash_aliases
	@rm -rf $(DST)/.bash_welcome
	@rm -rf $(DST)/.bash_logout
	@echo -e "\r[$(GREEN) OK $(RST)] Bash config removed"

remove-readline:
	@echo -n "Removing readline config..."
	@rm -rf $(DST)/.config/.inputrc
	@echo -e "\r[$(GREEN) OK $(RST)] Readline config removed"

remove-git:
	@echo -n "Removing git config..."
	@rm -rf $(DST)/.config/.gitconfig
	@echo -e "\r[$(GREEN) OK $(RST)] Git config removed"

remove-python:
	@echo -n "Removing python config..."
	@rm -rf $(DST)/.config/.pythonrc
	@rm -rf $(DST)/.python_history
	@echo -e "\r[$(GREEN) OK $(RST)] Python config removed"

remove-neovim:
	@echo -n "Removing neovim config..."
	@cd $(DST)/.local/src/neovim && make uninstall &>/dev/null
	@rm -rf $(DST)/.local/src/neovim
	@echo -e "\r[$(GREEN) OK $(RST)] Neovim config removed"

remove-node:
	@echo -n "Removing node config..."
	@rm -rf $(DST)/.cache/npm
	@echo -e "\r[$(GREEN) OK $(RST)] Node config removed"

re: re-apt \
	re-shared \
	re-bash \
	re-readline \
	re-git \
	re-python \
	re-node \
	re-neovim

re-apt: remove-apt apt

re-shared: remove-shared shared

re-bash: remove-bash bash

re-readline: remove-readline readline

re-git: remove-git git

re-python: remove-python python

re-node: remove-node node

re-neovim: remove-neovim neovim