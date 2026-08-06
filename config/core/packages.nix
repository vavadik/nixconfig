{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nerd-fonts.jetbrains-mono
    xwayland-satellite
  ];

  programs = {
    niri = {
      enable = true;
    };

    dms-shell = {
      enable = true;
      systemd = {
        enable = true;
        restartIfChanged = true;
      };
    };
  };
}
