{ pkgs, config, ... }:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true; # Recommended for some browser components
    };
  };
  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];
}
