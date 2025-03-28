{
  description = "Rust devShell";

  inputs = {
    utils.url = "github:numtide/flake-utils";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, rust-overlay, nixpkgs,  utils, ... }:
    utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ rust-overlay.overlays.default ];
      };
    in {

      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          (rust-bin.stable.latest.minimal.override {
            extensions = [
              "rust-src"
              "rust-analyzer"
            ];
          })
        ];

        shellHook = ''
          exec fish
        '';
      };

  });
}
