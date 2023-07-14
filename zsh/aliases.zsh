# ---ALIASES---

# ls
alias ll="ls -lhpg"
alias l="ls -p"
# la shows all info

# dotfiles folder
alias cdconf="cd $XDG_CONFIG_HOME"
# zsh
alias zshrc="nvim $ZDOTDIR/.zshrc"
alias zshenv="nvim $ZDOTDIR/.zshenv"
alias zshconf="cd $XDG_CONFIG_HOME/zsh/"
alias zshreload="source $ZDOTDIR/.zshrc"

# tmux
alias tmuxconf="nvim $XDG_CONFIG_HOME/tmux/.tmux.conf"
alias tmuxreload="tmux source-file $XDG_CONFIG_HOME/tmux/.tmux.conf"
alias tm="tmux a || tmux"

# nvim
alias vi="nvim"
alias viconf="cd $XDG_CONFIG_HOME/nvim/"
alias initlua="nvim $XDG_CONFIG_HOME/nvim/init.lua"

# Update/Upgrade into one alias
alias update="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"

# git scripts
alias gitpub="$XDG_CONFIG_HOME/zsh/scripts/git_publish.sh"
alias gitinit="$XDG_CONFIG_HOME/zsh/scripts/git_setup.sh"
gitcd() { cd "$(git rev-parse --show-toplevel)" } # cd to the project's root folder
# lazygit
alias lg="lazygit"

# other utility functions
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
# make a directory and jump to it
mkcdir() { mkdir -p "$1" && cd "$1" }
