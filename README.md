# **Sakuexe .dotfiles**

This repository includes all the configuration files that I use, as well as
guides for installing them. Recommendations and helpful suggestions are
always appreciated! :)

## Install Guides

I am using a ```.config/``` folder for my dotfiles, so the instructions will
be tailored towards that style. If you do not wish that, you can freely modify
the commands to suit your style.

### ```.config/``` folder

if you do not already have a ```.config/``` folder
```bash
git clone https://github.com/sakuexe/.dotfiles ~/
mv ~/.dotfiles ~/.config
```
if you DO have a ```.config/``` folder
```bash
git clone https://github.com/sakuexe/.dotfiles ~/
mv ~/.dotfiles/* ~/.config/
```

### Neovim

[Neovim Config Files](./nvim/README.md) - Editor of choice

### Zsh

[Zsh dotfiles](./zsh/README.md) - Shell and file navigation

### Tmux

[Tmux dotfiles](./tmux/README.md) - Terminal multiplexing

## TODOs / Bugs

- When using Neovim inside of tmux, it likes to give random rendering errors sometimes.

For example, when using WSL2 on the Windows Terminal, some of the text can show up multiplied.
This will fix itself after running Any command in the Tmux command line. Running a second window
alongside Neovim (vertical split), will lessen these errors, but not completely get rid of them.

If you find any ways to fix this, it would be greatly appreciated. Thank you.

## Miscellaneous

Here's a list of some of the other stuff I enjoy having downloaded on my terminal as well.

- [live-server](https://www.chiarulli.me/Neovim/20-live-server/) - For automatically refreshing
  the browser on reload

```bash
# install the npm package globally
npm install -g live-server
# live preview a folder
live-server some-directory/
# or a singular file
live-server some-file.html
```
