{ pkgs, user, ... }:

{
  imports = [
    ./dev-envs.nix
    ./packages.nix
    ./git.nix
    ./fish.nix
    ./tmux.nix
    ./ghostty.nix
    ./niri.nix
    ./noctalia.nix
    ./umbriel
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };
}
