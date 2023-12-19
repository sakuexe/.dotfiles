# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load the powerlevel10k theme
source "$ZPLUGINDIR/powerlevel10k/powerlevel10k.zsh-theme"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z-_}={A-Za-z_-}'

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# User configuration

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

# Check for .zsh files and make them executable
zsh_scripts=($script_folder/*.zsh)
if [ ${#zsh_scripts[@]} -gt 0 ]; then
    for zsh_script in $zsh_scripts; do
        chmod +x "$zsh_script"
    done
fi

# Check for .sh files and make them executable
sh_scripts=($script_folder/*.sh)
if [ ${#sh_scripts[@]} -gt 0 ]; then
    for sh_script in $sh_scripts; do
        chmod +x "$sh_script"
    done
fi

unsetopt nullglob  # Disable the nullglob option after use

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

export NVM_DIR="$XDG_CONFIG_HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
