{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  outputs = inputs @ { self, nixpkgs, ... }:
    let
      defaultSystems = function: nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ] (system: function (import nixpkgs {inherit system; }));
      ghcVer = "ghc982";
    in {
      packages = defaultSystems (pkgs: rec {
        preluwude = import ./default.nix { inherit pkgs ghcVer; };
        default = preluwude;
      });

      devShells = defaultSystems (pkgs: rec {
        preluwude = import ./shell.nix { inherit pkgs ghcVer; };
        default = preluwude;
      });
    };
}

