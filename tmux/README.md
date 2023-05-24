# **Tmux Configuration**

## Optional Dependecy

I am using a .config folder for my dotfiles, so make sure that you have
the following installed in your .bashrc/.zshenv if you'd like to as well.

```bash
# .config folder
XDG_CONFIG_HOME="$HOME/.config"
# find the folder for zsh configs
ZDOTDIR="$XDG_CONFIG_HOME/zsh"
```

## Install instructions

1. Install tmux

```bash
sudo apt install tmux
tmux -V # 3.3a (as of May 2023)
```

2. Download the tmux package manager [tpm](https://github.com/tmux-plugins/tpm)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

3. OPTIONAL: Create a symbolic from the .config to the home folder

```bash
# do this if tmux cannot find your configuration file in .config/tmux/
ln -s ~/.config/tmux/.tmux.conf ~/.tmux.conf
```

#### Return to .dotfiles
[Return here](../)
