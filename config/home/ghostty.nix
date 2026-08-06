{ pkgs, xdg, ... }:

{
  xdg.configFile."ghostty/config".source = ./dotfiles/ghostty/config;
  home = {
    stateVersion = "26.05";

    packages = with pkgs; [
      ghostty
    ];
  };
}
