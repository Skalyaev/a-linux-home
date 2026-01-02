BASH_SRC=$(PWD)/home
BASH_DST=$(HOME)

READLINE_SRC=$(PWD)/home/.config
READLINE_DST=$(HOME)/.config

NVIM_SRC=$(PWD)/home/.config/nvim
NVIM_DST=$(HOME)/.config/nvim

GIT_SRC=$(PWD)/home/.config
GIT_DST=$(HOME)/.config

PYTHON_SRC=$(PWD)/home/.config
PYTHON_DST=$(HOME)/.config

all: bash readline neovim git python

bash:
	@ln -sf $(BASH_SRC)/.profile $(BASH_DST)
	@ln -sf $(BASH_SRC)/.bashrc $(BASH_DST)
	@ln -sf $(BASH_SRC)/.bash_env $(BASH_DST)
	@ln -sf $(BASH_SRC)/.bash_aliases $(BASH_DST)
	@ln -sf $(BASH_SRC)/.bash_welcome $(BASH_DST)
	@ln -sf $(BASH_SRC)/.bash_logout $(BASH_DST)
	@echo 'Bash config linked'

readline:
	@mkdir -p $(READLINE_DST)
	@ln -sf $(READLINE_SRC)/.inputrc $(READLINE_DST)
	@echo 'Readline config linked'

neovim:
	@mkdir -p $(NVIM_DST)
	@ln -sf $(NVIM_SRC)/init.lua $(NVIM_DST)
	@ln -sf $(NVIM_SRC)/lua $(NVIM_DST)
	@echo 'Neovim config linked'

git:
	@ln -sf $(GIT_SRC)/.gitconfig $(GIT_DST)
	@echo 'Git config linked'

python:
	@ln -sf $(PYTHON_SRC)/.pythonrc $(PYTHON_DST)
	@echo 'Python config linked'

.PHONY: all bash readline neovim git python
