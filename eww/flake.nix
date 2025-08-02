{
  description = "Custom notification handler written in python";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      python = (
        pkgs.python313.withPackages (
          python313Packages: with python313Packages; [
            dbus-python
            pygobject3
            jedi-language-server
          ]
        )
      );
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        propagatedBuildInputs = [
          python
          # just in case lsp does not see dependencies
          pkgs.python313Packages.dbus-python
          pkgs.python313Packages.pygobject3
          pkgs.python313Packages.jedi-language-server
        ];
      };
    };
}
