{ pkgs ? import <nixpkgs>, ghcVer ? "ghc982", ... }:

pkgs.stdenv.mkDerivation {
  name = "preluwude";
  version = "v0.1";
  src = ./.;

  buildInputs =
    (with pkgs; [
      haskell.compiler.${ghcVer}
      cabal-install ]) ++
    (with pkgs.haskell.packages.${ghcVer}; [
      vector
      containers
      text
      witherable
      bytestring
    ]);

  buildPhase = ''
    cabal build
  '';

  installPhase = ''
    cabal install
  '';
}
