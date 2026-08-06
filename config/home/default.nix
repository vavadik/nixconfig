{ pkgs, user, ... }:

{
  imports = [
    ./packages.nix
    ./git.nix
    ./fish.nix
    ./ghostty.nix
    ./niri.nix
  ];
}
