{ pkgs, lib, ... }:

{
  boot.kernelPackages = lib.mkForce pkgs.unstable.linuxPackages_latest;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  imports = [
    ./nvidia.nix
    ./user.nix
    ./packages.nix
    ./gaming.nix
  ];
}
