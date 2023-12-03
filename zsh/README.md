# **Zsh Configuration**

## Install instructions

1. Install zsh

```bash
# ubuntu/debian based
sudo apt install zsh -y
# opensuse
sudo zypper in zsh -y
```

2. Make a symlink for the .zshenv file

```bash
ln -s ~/.config/zsh/.zshenv ~/
```

3. Git clone the the plugins

```bash
# theme: PowerLevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/plugins/powerlevel10k
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting
```

4. Head into zsh, set up your theme and enjoy!

```bash
zsh
```

### Optional

- Install [Nerd Fonts](https://www.nerdfonts.com/font-downloads) for the PowerLevel10k theme to work as intended

If you're on WSL2, do these tricks

- Exclude windows directiories from the `$PATH` to speed up the shell on WSL2

```bash
# /etc/wsl.conf
[interop]
appendWindowsPath = false
```

- Uncomment the WSL lines from the .zshenv that fit your needs

## Plugins

#### Downloaded plugins

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)
  (suggestions and autocomplete for the shell)

- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)
  (syntax highlighting for an easier and prettier shell experience)

#### Oh-My-Zsh plugins that I copied

- [web-search](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search)
  (for easy googling and searching through the terminal)

#### Return to .dotfiles

[Return here](../)
