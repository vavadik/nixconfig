{ pkgs, user, ... }:

{
  home = {
    stateVersion = "26.05";

    packages = with pkgs; [
      fzf
      lsd
      zoxide
      claude-code
      bat
      satisfactorymodmanager
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
    helix = {
      enable = true;
      settings = {
        theme = "dark_plus_transparent";
        editor = {
          line-number = "relative";
          cursor-shape = {
            normal = "block";
            insert = "bar";
            select = "underline";
          };
        };
      };
      languages.language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "nixfmt";
        }
      ];
      themes = {
        dark_plus_transparent = {
          "inherits" = "dark_plus";
          "ui.background" = { };
        };
      };
    };
  };
}
