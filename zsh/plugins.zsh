# Syntax highlighting
source "$ZPLUGINDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# Autosuggestions
source "$ZPLUGINDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Other single file plugins
plugins=($ZPLUGINDIR/*.zsh)
if [ ${#plugins[@]} -gt 0 ]; then
    for plugin in $plugins; do
        source "$plugin"
    done
fi
