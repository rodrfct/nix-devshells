{
  description = "Java devShell";

  inputs = {
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, ... }:
    utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {

      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          jdk
          java-language-server
          kotlin-language-server
          gradle
        ];

        shellHook = ''
          exec fish
          patch_gradle_libnativeplatform
        '';
      };

      # Only for NixOS
      packages.patch_gradle = import ./patch_gradle_libnativeplatform.nix {inherit pkgs;};

  });
}
