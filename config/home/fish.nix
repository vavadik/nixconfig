{ pkgs, user, ... }:

{
  home = {
    stateVersion = "26.05";

    packages = with pkgs; [
      fish
      fishPlugins.fzf-fish
      fishPlugins.bass
      fishPlugins.tide
    ];
  };

  programs = {
    fish = {
      enable = true;
      shellAliases = {
        "code" = "cursor";
        "ls" = "lsd";
      };

      shellInit = ''
        set -gx tide_character_vi_icon_default "❯"
      '';

      interactiveShellInit = ''
        zoxide init fish | source
      '';
    };
  };
}
