# dotfiles folder
export XDG_CONFIG_HOME="$HOME/.config"
# find the .zshrc file
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZPLUGINDIR="$ZDOTDIR/plugins"
# enable use of colors (and neovim) for man pages
export MANPAGER='nvim +Man!'

# WSL

# for browser integration to work (like with google "term")
# export BROWSER='/mnt/c/Program Files/Mozilla Firefox/firefox.exe'
# for android sdk to work on wsl
# export ANDROID_HOME='/mnt/c/Users/sakuk/AppData/Local/Android/Sdk'
# remove the windows path from the PATH variable
# export PATH=$(echo $PATH | sed -e 's/:\/mnt.*//g')
