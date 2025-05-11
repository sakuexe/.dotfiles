# XDG base directories specification
# https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# zsh related files
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZPLUGINDIR="$ZDOTDIR/plugins"

# enable use of colors (and neovim) for man pages
export MANPAGER='nvim +Man!'

# programming related
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"

# WSL

# for browser integration to work (like with google "term")
# export BROWSER='/mnt/c/Program Files/Mozilla Firefox/firefox.exe'
# for android sdk to work on wsl
# export ANDROID_HOME='/mnt/c/Users/sakuk/AppData/Local/Android/Sdk'
# remove the windows path from the PATH variable
# export PATH=$(echo $PATH | sed -e 's/:\/mnt.*//g')
