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

        react = {
          path = ./react;
          description = "React devShell";
        };


        rust = {
          path = ./rust;
          description = "Rust devShell";
        };

        tauri = {
          path = ./tauri;
          description = "Tauri devShell";
        };

        java = {
          path = ./java;
          description = "Java devShell";
        };

      };
    };
}
