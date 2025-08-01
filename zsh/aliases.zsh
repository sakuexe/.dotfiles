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
alias update="sudo zypper ref && sudo zypper dup --allow-vendor-change && sudo flatpak update -y"

# git
gitcd() { cd "$(git rev-parse --show-toplevel)" } # cd to the project's root folder
alias gitpub="$ZDOTDIR/scripts/git-publish.sh"
alias gitinit="$ZDOTDIR/scripts/git-setup.sh"
alias gitref="git rm -rf --cached . > /dev/null && git add . && git status"
alias gs="git status"
# lazygit
alias lg="lazygit"

# %h: abbreviated commit hash, %ad: commit date, %s: commit message
retrogit() { git log --format="[%ad] %h - %s" --date=short -- $1 | fzf --preview "echo {} | awk '{ print \$2 }' | xargs -I {} git show {}:./$1" }

# other utility functions

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# make a directory and jump to it
mkcdir() { mkdir -p "$1" && cd "$1" }

# open a port to the internet (tcp)
# openport() { sudo firewall-cmd --add-port=$1/tcp }

# Django development
alias dj="python3 manage.py"
alias djrun="python3 manage.py runserver"
alias djmig="python3 manage.py makemigrations && python3 manage.py migrate"
alias djshell="python3 manage.py shell"

# Use fzf to search for available man pages
alias fman="man -k . | fzf --preview='echo {} | awk \"{ print \$1 }\" | xargs man' | awk '{ print \$1 }' | xargs man"

# get the link to today's fingerpori (thank you kaleva.fi!)
alias fingerpori="curl -s -X GET https://www.kaleva.fi/sarjakuvat/fingerpori | grep -A 3 \"cartoon-strip__image\" | grep -oP '(?<=<img src=\")[^\"?]*'"
