{ pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };
  environment.systemPackages = [
    pkgs.lazydocker
  ];
}
