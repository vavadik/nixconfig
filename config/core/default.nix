{ pkgs, ... }:

{
  imports = [
    ./user.nix
    ./packages.nix
  ];
}
