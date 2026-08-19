{ pkgs, user, ... }:

{
  imports = [
    ./packages.nix
    ./git.nix
    ./fish.nix
    ./tmux.nix
    ./ghostty.nix
    ./niri.nix
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };
}
