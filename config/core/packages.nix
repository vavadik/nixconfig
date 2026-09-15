{
  pkgs,
  user,
  inputs,
  ...
}:

let
  # Chromium Wayland color-management workaround (dim/wrong SDR gamma on HDR).
  # Not expressible via Cursor's argv.json; bake into package wrappers instead.
  chromiumWaylandArgs = "--disable-features=WaylandWpColorManagerV1";
in
{
  environment.systemPackages = with pkgs; [
    nixfmt
    nodejs_24
    vim
    fastfetch
    nerd-fonts.jetbrains-mono
    xwayland-satellite
    (google-chrome.override { commandLineArgs = chromiumWaylandArgs; })
    (microsoft-edge.override { commandLineArgs = chromiumWaylandArgs; })
    (code-cursor.override { commandLineArgs = chromiumWaylandArgs; })
    teams-for-linux
    slack
    telegram-desktop
    junction
    capitaine-cursors
    grim
    slurp
    jq
    satty
    swappy
    mc
    nautilus
    xsettingsd
    xrdb
    libreoffice
    nvd
    qbittorrent
    wl-clipboard
    playwright
    vlc
    python313
    imagemagick
    p7zip
    loupe
    unstable.protonup-qt
    dotnet-runtime_10
  ];

  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-runtime_10}/share/dotnet";
  };

  # Default apps (Junction for links, Loupe for images). Change here, not in the UI.
  xdg.mime.defaultApplications = {
    "image/jpeg" = "org.gnome.Loupe.desktop";
    "image/png" = "org.gnome.Loupe.desktop";
    "image/gif" = "org.gnome.Loupe.desktop";
    "image/webp" = "org.gnome.Loupe.desktop";
    "image/bmp" = "org.gnome.Loupe.desktop";
    "image/tiff" = "org.gnome.Loupe.desktop";
    "image/svg+xml" = "org.gnome.Loupe.desktop";
    "text/html" = "re.sonny.Junction.desktop";
    "x-scheme-handler/http" = "re.sonny.Junction.desktop";
    "x-scheme-handler/https" = "re.sonny.Junction.desktop";
    "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
  };

  # Disable the native, broken command-not-found database
  programs.command-not-found.enable = false;

  # Enable the new nix-index database & shell integrations
  programs.nix-index-database.comma.enable = true; # Allows using `, <command>` to run uninstalled tools
  programs.nix-index.enable = true;
  programs.nix-index.enableBashIntegration = true;
  #programs.nix-index.enableZshIntegration = true;
  programs.nix-index.enableFishIntegration = true;

  programs = {
    # Registers fish in /etc/shells and, critically, makes NixOS import
    # /etc/set-environment (environment.variables, incl. NH_FLAKE below)
    # into fish sessions. home-manager's programs.fish.enable alone doesn't
    # do this -- that's why NH_FLAKE was only ever visible in bash.
    fish.enable = true;

    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        dotnet-runtime_10
        # Add any missing dynamic libraries for unpackaged programs
        # here, NOT in environment.systemPackages
      ];
    };
    nh = {
      enable = true;
      flake = "/home/${user.name}/nixconfig#nixos";
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep 5 --keep-since 3d";
      };
    };
  };
}
