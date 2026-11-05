{
  description = "Node.js devShell";

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
          nodejs
        ];

        shellHook = ''
          exec fish
        '';
      };

  });
}
