# dotfiles folder
export XDG_CONFIG_HOME="$HOME/.dotfiles"
# find the .zshrc file
export ZDOTDIR="$XDG_CONFIG_HOME/zsh/setup"
# Path to the oh-my-zsh installation.
export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"
# path to the custom scripts to be run on startup
export ZSH_CUSTOM="$XDG_CONFIG_HOME/zsh"
# for browser integration to work (like with google "term")
export BROWSER='/mnt/c/Program Files/Mozilla Firefox/firefox.exe'
# for android sdk to work on wsl
export ANDROID_HOME='/mnt/c/Users/sakuk/AppData/Local/Android/Sdk'
# for WSL, remove the windows path from the PATH variable
# export PATH=$(echo $PATH | sed -e 's/:\/mnt.*//g')
