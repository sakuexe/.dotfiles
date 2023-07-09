# dotfiles folder
XDG_CONFIG_HOME="$HOME/.dotfiles"
# find the .zshrc file
ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# Path to the oh-my-zsh installation.
ZSH="$XDG_CONFIG_HOME/oh-my-zsh"
ZSH_CUSTOM="$ZDOTDIR"
# for browser integration to work (like with google "term")
BROWSER='/mnt/c/Program Files/Mozilla Firefox/firefox.exe'
# to get rid of the annoying error of gpg-agent:
# gpg: public key decryption failed: Inappropriate ioctl for device
GPG_TTY=$(tty)
