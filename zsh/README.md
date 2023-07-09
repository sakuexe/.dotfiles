# **Zsh Configuration**

## Install instructions

The following instuctions expect that you have a `~/.dotfiles/`
folder for your dotfiles. You can also modify the commands to suit your style.

1. Install zsh and oh-my-zsh

```bash
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2. Run the script to take care of the annoying parts

```bash
chmod +x ~/.dotfiles/zsh/setup/install.sh
~/.dotfiles/zsh/setup/install.sh
```

3. Restart your terminal and download the plugins

```bash
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# theme: PowerLevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

4. Source the `.zshrc` file and enjoy

```bash
source ~/.zshrc
```

### Optional

- Install [Nerd Fonts](https://www.nerdfonts.com/font-downloads) for the PowerLevel10k theme to work as intended

- Exclude windows directiories from the `$PATH` to speed up the shell on WSL2

```bash
# Uncomment the following line in .zshenv
export PATH=$(echo $PATH | sed -e 's/:\/mnt.*//g')
# Or by adding the following lines to /etc/wsl.conf
[interop]
appendWindowsPath = false
```

## Plugins

#### Downloaded plugins

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)
  (suggestions and autocomplete for the shell)

- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)
  (syntax highlighting for an easier and prettier shell experience)

#### Oh-My-Zsh built-in plugins

- [web-search](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search)
  (for easy googling and searching through the terminal)

- [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)
  (useful git snippets for the shell)

#### Return to .dotfiles

[Return here](../)
