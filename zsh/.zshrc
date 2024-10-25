# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load the powerlevel10k theme
# source "$ZPLUGINDIR/powerlevel10k/powerlevel10k.zsh-theme"

# Hyphen insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z-_}={A-Za-z_-}'

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Load plugins
source "$ZDOTDIR/plugins.zsh"

# Load aliases
source "$ZDOTDIR/aliases.zsh"

# Set scripts to be executable
script_folder="$ZDOTDIR/scripts"
setopt nullglob  # Enable the nullglob option

# Check for .zsh files and source them
zsh_scripts=($script_folder/*.zsh)
if [ ${#zsh_scripts[@]} -gt 0 ]; then
    for zsh_script in $zsh_scripts; do
        source "$zsh_script"
    done
fi

# Check for .sh files and source them
sh_scripts=($script_folder/*.sh)
if [ ${#sh_scripts[@]} -gt 0 ]; then
    for sh_script in $sh_scripts; do
        source "$sh_script"
    done
fi

unsetopt nullglob  # Disable the nullglob option after use

# Fixes the issue where password-store's completion doesn't work
autoload -Uz compinit && compinit

# autostart tmux if installed
if command -v tmux>/dev/null; then
  # check if shell is interactive and tmux is not already running
  if [[ ! -z "$PS1" ]] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]]
  then
    tmux a || tmux
  fi
fi

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups

# enable ctrl r, ctrl e and other essentials
# https://gist.github.com/acamino/2bc8df5e2ed0f99ddbe7a6fddb7773a6
bindkey -e

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
