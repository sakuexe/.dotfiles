
activate_dev_flake() {
  nix_dev_cmd() {
    nix develop git+file://$PWD\?ref=HEAD --command zsh -lc "$1" \
      || nix develop --command zsh -lc "$1"
  }
  OS=$(grep '^NAME' /etc/os-release | sed 's/NAME=//')

  if [ "$OS" = "NixOS" ] && [ -f "flake.nix" ]; then
    nix_dev_cmd "clear; exec zsh"
  fi

  clear
}
