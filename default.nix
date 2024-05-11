{ pkgs ? import <nixpkgs>, ... }:

pkgs.stdenv.mkDerivation {
  name = "preluwude";
  version = "v0.1";
  src = ./.;

  buildInputs =
    (with pkgs; [
      ghc
      cabal-install
    ]) ++
    (with pkgs.haskellPackages; [
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
