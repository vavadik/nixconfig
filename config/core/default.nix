{ pkgs, lib, ... }:

{
  boot.kernelPackages = lib.mkForce pkgs.unstable.linuxPackages_latest;
  boot = {
    plymouth = {
      enable = true;
      theme = "bgrt";
    };

    # Optional: hide boot messages
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
    ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  imports = [
    ./nvidia.nix
    ./user.nix
    ./packages.nix
    ./gaming.nix
    ./docker.nix
  ];
}
