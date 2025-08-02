activate_dev_flake() {
  OS=$(grep '^NAME' /etc/os-release | sed 's/NAME=//')

  if [ "$OS" = "NixOS" ] && [ -f "flake.nix" ]; then
    nix develop git+file://$PWD\?ref=HEAD --command zsh -c "clear; exec zsh" \
      || nix develop --command zsh -c "clear; exec zsh"
  fi

  clear
}
