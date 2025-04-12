{
  description = "Vue.js devShell";

  inputs = {
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, ... }:
    utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {

      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          vscode-langservers-extracted
          typescript
          typescript-language-server
          nodePackages_latest.nodejs
          vue-language-server

          firefox-devedition
          brave
          epiphany
        ];

        shellHook = ''
          exec fish
        '';
      };

  });
}
