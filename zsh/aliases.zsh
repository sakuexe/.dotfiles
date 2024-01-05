# clear the terminal
alias c="clear"

# ls
alias la="ls -laFh --color=auto"  # show all
alias ll="ls -lhpg --color=auto"  # long format, hide hidden
alias l="ls -F --color=auto"      # list short form

# navigate to dotfiles folder
alias cdconf="cd $XDG_CONFIG_HOME"
# zsh
alias zshrc="nvim $ZDOTDIR/.zshrc"
alias zshenv="nvim $ZDOTDIR/.zshenv"
alias zshconf="cd $ZDOTDIR"
alias zshreload="source $ZDOTDIR/.zshenv && source $ZDOTDIR/.zshrc"

# tmux
alias tmuxconf="nvim $XDG_CONFIG_HOME/tmux/.tmux.conf"
alias tmuxreload="tmux source-file $XDG_CONFIG_HOME/tmux/.tmux.conf"
alias tm="tmux a || tmux"

# nvim
alias vi="nvim"
alias viconf="cd $XDG_CONFIG_HOME/nvim/"
alias initlua="nvim $XDG_CONFIG_HOME/nvim/init.lua"

# Update/Upgrade into one alias
# Ubuntu
# alias update="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"
# OpenSuse Tumbleweed
alias update="sudo zypper ref && sudo zypper dup -y && flatpak update -y"

# git
gitcd() { cd "$(git rev-parse --show-toplevel)" } # cd to the project's root folder
alias gitref="git rm -rf --cached . > /dev/null && git add . && git status"
# scripts
alias gitpub="$ZDOTDIR/scripts/git-publish.sh"
alias gitinit="$ZDOTDIR/scripts/git-setup.sh"
# lazygit
alias lg="lazygit"

# other utility functions

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# make a directory and jump to it
mkcdir() { mkdir -p "$1" && cd "$1" }
