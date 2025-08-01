# Other single file plugins
setopt nullglob
plugins=($ZPLUGINDIR/*.zsh)
if [ ${#plugins[@]} -gt 0 ]; then
    for plugin in $plugins; do
        source "$plugin"
    done
fi
unsetopt nullglob

OS=$(grep '^NAME' /etc/os-release | sed 's/NAME=//')

# do not source plugins on nixos, because they are loaded
# from nixpkgs
if [ "$OS" != "NixOS" ]; then
  # Syntax highlighting
  source "$ZPLUGINDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  # Autosuggestions
  source "$ZPLUGINDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
