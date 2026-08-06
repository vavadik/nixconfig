{ pkgs, user, ... }:

{
  home = {
    stateVersion = "26.05";

    packages = with pkgs; [
      fzf
      lsd
      zoxide
      claude-code
    ];
  };
  programs = {
    direnv = {
      enable = true;
      silent = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
