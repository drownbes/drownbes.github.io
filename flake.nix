{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, flake-utils, nixpkgs }: 
    flake-utils.lib.eachDefaultSystem (system: let
      overlay = final: prev: {};
      pkgs = nixpkgs.legacyPackages.${system}.extend overlay;
    in {
      devShells.default = pkgs.mkShell {
        shellHook = ''
          export SHELL="${pkgs.bashInteractive}/bin/bash"
        '';
        nativeBuildInputs = [
        ];
        buildInputs = with pkgs;[
          zola
         
        ];
      };
    });
}
