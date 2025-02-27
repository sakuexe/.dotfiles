#!/usr/bin/env bash

OS=$(grep '^NAME' /etc/os-release | sed 's/NAME=//')

# neovim
if command -v nvim &> /dev/null; then
  echo "nvim not found, installing..."
  if [ "$OS" == "Ubuntu" ]; then
    sudo apt update && sudo apt install neovim -y
  fi
  if [ "$OS" == "OpenSuse Tumbleweed" ]; then
    sudo zypper ref && sudo zypper in neovim -y
  fi
  if [ "$OS" == "Arch Linux" ]; then
    sudo pacman -Sy --noconfirm neovim
  fi
fi

ln -s $PWD/nvim ~/.config/nvim

# tmux
if command -v tmux &> /dev/null; then
  echo "tmux not found, installing..."
  if [ "$OS" == "Ubuntu" ]; then
    sudo apt update && sudo apt install tmux -y
  fi
  if [ "$OS" == "OpenSuse Tumbleweed" ]; then
    sudo zypper ref && sudo zypper in tmux -y
  fi
  if [ "$OS" == "Arch Linux" ]; then
    sudo pacman -Sy --noconfirm tmux
  fi
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s $PWD/tmux/.tmux.conf ~/

# oh-my-posh
if command -v omp &> /dev/null; then
  echo "oh-my-posh not found, installing..."
  curl -s https://ohmyposh.dev/install.sh | bash -s
fi

ln -s $PWD/omp ~/.config/omp

# zsh 
if command -v zsh &> /dev/null; then
  echo "zsh not found, installing..."
  if [ "$OS" == "Ubuntu" ]; then
    sudo apt update && sudo apt install zsh -y
  fi
  if [ "$OS" == "OpenSuse Tumbleweed" ]; then
    sudo zypper ref && sudo zypper in zsh -y
  fi
  if [ "$OS" == "Arch Linux" ]; then
    sudo pacman -Sy --noconfirm zsh
  fi
fi

ln -s $PWD/zsh/.zshenv ~/
source ~/.zshenv

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ./plugins/zsh-autosuggestions
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ./plugins/zsh-syntax-highlighting

ln -s $PWD/zsh $ZDOTDIR
zsh
