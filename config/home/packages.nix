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
  home.file.".local/share/icons/default" = {
    source = "${pkgs.capitaine-cursors}/share/icons/capitaine-cursors/";
    recursive = true;
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
