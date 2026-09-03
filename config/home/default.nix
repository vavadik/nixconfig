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

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark"; # Or your preferred dark theme name
      package = pkgs.gnome-themes-extra;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  # Required for GTK4 / libadwaita apps to respect dark mode globally
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };
}
