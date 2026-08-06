{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nerd-fonts.jetbrains-mono

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
      }
    };
  };
}
