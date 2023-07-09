# **Tmux Configuration**

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

### Optional: using the `.dotfiles` folder

I am using a `.dotfiles` folder for my config files, so make sure that you have
the following installed in your .bashrc/.zshenv if you'd like to as well.

Therefore, you will need to have the following environment variables set in
your `.zshenv` file. alternatively if that does not work for you,
you can also just add a symbolic link to the home folder, pointing to the
.tmux.conf file in the `.dotfiles/tmux` folder.

```bash
# environment variable will look like the following
XDG_CONFIG_HOME="$HOME/.config"
# or the symlink alternative
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

#### Return to .dotfiles

[Return here](../)
