![](preview.jpg)

> Ubuntu (WSL) based setup

### Requirements

```bash
#==========================#
# Bash config requirements #
#==========================#

sudo apt install -y lolcat
sudo apt install -y figlet

sudo rm -r /usr/share/figlet
sudo cp -r usr/share/figlet /usr/share
```

```bash
#==================================#
# Neovim :checkhealth requirements #
#==================================#

sudo apt install -y nodejs
sudo apt install -y npm
sudo apt install -y python3-venv
sudo apt install -y ripgrep

# Then install NVM
# Then source ~/.bashrc

nvm install node
npm install -g neovim
npm install -g tree-sitter-cli

#python3 -m venv ~/.local/share/pyenv
#. ~/.local/share/pyenv/bin/activate
pip install pynvim
```

```bash
#=========================#
# Neovim LSP requirements #
#=========================#
mkdir -p ~/.local/share

# Python
npm install -g pyright
pip install ruff-lsp

# Bash
npm install -g bash-language-server

# JS/TS
npm install -g typescript typescript-language-server

# Rust
#
# https://rustup.rs/
# mv ~/.cargo ~/.rustup ~/.local/share/.
rustup component add rust-analyzer

# C/C++
sudo apt install -y ccls

# Dockerfile
npm install -g dockerfile-language-server-nodejs

# Lua
# https://luals.github.io/wiki/build/
```

### Install

```bash
git clone https://github.com/Skalyaev/a-linux-home.git
cd a-linux-home && make
```

### Post Install

```bash
# Python history file
#
# On the first use of the python CLI,
# the `.python_history` file is created
# both in `~/` and `~/.history/`.
# On subsequent runs, only ~/.history is used.
#
python
exit()

rm ~/.python_history
cat ~/.history/.python_history
```

```bash
# NPM cache
npm config set cache ~/.cache/npm --global
mv ~/.npm ~/.cache/npm
```
