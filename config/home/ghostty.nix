{ pkgs, ... }:

{
  home = {
    stateVersion = "26.05";

    packages = with pkgs; [
      ghostty
    ];

    xdg.configFile."ghostty/config".source = ./dotfiles/ghostty/config;
  };
}
