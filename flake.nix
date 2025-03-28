{
  description = "My devshells";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      templates = {

        vue = {
          path = ./vue;
          description = "Vue.js devShell";
        };

        rust = {
          path = ./rust;
          description = "Rust devShell";
        };

        java = {
          path = ./java;
          description = "Java devShell";
        };

      };
    };
}
