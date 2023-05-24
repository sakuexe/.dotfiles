# **Sakuexe .dotfiles**

This repository includes all the configuration files that I use, as well as
guides for installing them. Recommendations and helpful suggestions are
always appreciated! :)

## Install Guides

I am using a `.config/` folder for my dotfiles, so the instructions will
be tailored towards that style. If you do not wish that, you can freely modify
the commands to suit your style.

### `.config/` folder

if you do not already have a `.config/` folder

```bash
git clone https://github.com/sakuexe/.dotfiles ~/
mv ~/.dotfiles ~/.config
```

if you DO have a `.config/` folder

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

- Nerdfont V3

Due to the newest update to the nerdfonts, some icons do not work. I have modified
the lualine settings to use as little of those icons as possible. Note that
this might (and hopefully soon) be fixed eventually.

If you find any new info on this problem, all help would be greatly appreciated!

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

- [git-credential-manager](https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md#tarball)

Download the latest [tarball](https://github.com/git-ecosystem/git-credential-manager/releases/latest)

```bash
tar -xvf <path-to-tarball> -C /usr/local/bin
git-credential-manager configure
git config --global credential.credentialStore cache
# will remember your credentials after next login
```

Uninstalling git-credential-manager

```bash
git-credential-manager unconfigure
rm $(command -v git-credential-manager)
```
