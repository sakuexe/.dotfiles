# **Zsh Configuration**

## Install instructions

The following instuctions expect that you have a ```.config/``` 
folder for your dotfiles. You can modify the commands to suit your style.

1. Install zsh and oh-my-zsh

```bash
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2. Move the files to the .config folder

```bash
mkdir ~/.config/oh-my-zsh ~/.config/zsh
mv ~/.oh-my-zsh/* ~/.config/oh-my-zsh/
mv ~/.zshrc ~/.config/zsh/
rmdir ~/.oh-my-zsh/
```

3. Make a symbolic link for the zsh environment variables

```bash
ln -s ~/.config/zsh/.zshenv ~/.zshenv
```

4. Reload zsh

```bash
source ~/.config/zsh/.zshrc
# You will see couple of errors here, but don't worry
```

4. Download zsh plugins and the theme

```bash
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# theme: PowerLevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

5. Reload zsh again

```bash
source ~/.config/zsh/.zshrc
# No errors this time :)
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