# **Zsh Configuration**

## Install instructions

The following instuctions expect that you have a `~/.dotfiles/`
folder for your dotfiles. You can also modify the commands to suit your style.

1. Install zsh and oh-my-zsh

```bash
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2. Source the environment variables

```bash
source $HOME/.dotfiles/zsh/setup/.zshenv
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
