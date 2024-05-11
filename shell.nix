{ pkgs ? import <nixpkgs>, ... }:

pkgs.mkShell {
  name = "preluwude";
  packages =
    (with pkgs; [
      git
      ghc
      cabal-install
      haskell-language-server
    ]) ++
    (with pkgs.haskellPackages; [
      vector
      containers
      text
      witherable
      bytestring
    ]);
}
