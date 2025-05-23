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

# Load zsh hotkeys
source "$ZDOTDIR/hotkeys.zsh"

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

# Load bash completion functions (to get compgen working)
autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit

# use oh-my-posh
if ! command -v oh-my-posh &> /dev/null && [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
  export PATH="$PATH:$HOME/.local/bin"
fi
OMP_THEME="simple.toml"
eval "$(oh-my-posh init zsh --config $XDG_CONFIG_HOME/omp/$OMP_THEME)"

# use fzf shell integration if fzf is installed
if command -v fzf &> /dev/null; then
  source <(fzf --zsh)
fi
