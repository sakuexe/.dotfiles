#!/usr/bin/env bash

set -euo pipefail  # Strict mode: exit on errors, unset variables, or failed pipes
OS=$(grep '^NAME' /etc/os-release | sed 's/NAME=//')

# install packages
if [ "$OS" == '"Ubuntu"' ]; then
  sudo apt update && sudo apt install neovim tmux zsh \
    git unzip curl nodejs ripgrep gcc g++ make -y
fi
if [ "$OS" == '"OpenSuse Tumbleweed"' ]; then
  sudo zypper ref && sudo zypper in neovim tmux zsh \
    git unzip ripgrep gcc gcc-c++ make -y
fi
if [ "$OS" == '"Arch Linux"' ]; then
  sudo pacman -Sy --noconfirm neovim tmux zsh \
    git unzip ripgrep gcc g++ make
fi

# zsh 
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ./zsh/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ./zsh/plugins/zsh-syntax-highlighting

ln -s $PWD/zsh/.zshenv ~/.zshenv
source ~/.zshenv # get the env variables, so we know where to place the files
mkdir -p $XDG_CONFIG_HOME
ln -s $PWD/zsh $ZDOTDIR
sudo chsh -s /bin/zsh

# oh-my-posh
if ! command -v oh-my-posh &> /dev/null; then
  echo "oh-my-posh not found, installing..."
  mkdir -p ~/.local/bin
  if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    export PATH="$PATH:$HOME/.local/bin"
  fi
  curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin
fi
ln -s $PWD/omp $XDG_CONFIG_HOME/omp

# neovim
ln -s $PWD/nvim $XDG_CONFIG_HOME/nvim

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s $PWD/tmux/tmux.conf ~/.tmux.conf
