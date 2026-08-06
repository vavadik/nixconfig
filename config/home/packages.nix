{ pkgs, user, ... }:

{
  home = {
    stateVersion = "26.05";

    packages = with pkgs; [
      fzf
      lsd
      zoxide
    ];
  };
  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
