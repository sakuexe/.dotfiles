# **Tmux Configuration**

## Install instructions

1. Install tmux

```bash
sudo apt install tmux
tmux -V # 3.3a (as of May 2023)
```

2. Download the tmux package manager [tpm](https://github.com/tmux-plugins/tpm)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

3. Make a symlink to the `.tmux.conf` file

```bash
ln -s ~/.config/tmux/.tmux.conf ~/
```

4. Open tmux and install plugins

```bash
tmux 
<C-t>I
```

#### Return to .dotfiles

[Return here](../)
