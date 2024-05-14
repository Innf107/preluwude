{ pkgs ? import <nixpkgs>, ghcVer ? "ghc982", ... }:

pkgs.mkShell {
  name = "preluwude";
  packages =
    (with pkgs; [
      git
      haskell.compiler.${ghcVer}
      cabal-install
      # haskell-language-server
    ]) ++
    (with pkgs.haskell.packages.${ghcVer}; [
      vector
      containers
      text
      witherable
      bytestring
    ]);
}
