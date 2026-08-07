{
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    nixfmt
    nodejs
    vim
    fastfetch
    nerd-fonts.jetbrains-mono
    xwayland-satellite
    google-chrome
    microsoft-edge
    code-cursor
    teams-for-linux
    slack
    telegram-desktop
    junction
    capitaine-cursors
    grim
    slurp
    jq
    satty
    mc
    gnome-tweaks
    xsettingsd
    xrdb
  ];

  imports = [ inputs.dms-plugin-registry.nixosModules.default ];

  programs = {
    niri = {
      enable = true;
    };

    dms-shell = {
      package = pkgs.unstable.dms-shell;
      enable = true;
      systemd = {
        enable = true;
        restartIfChanged = true;
      };
      # Core features
      enableSystemMonitoring = true; # System monitoring widgets (dgop)
      enableVPN = true; # VPN management widget
      enableDynamicTheming = true; # Wallpaper-based theming (matugen)
      enableAudioWavelength = true; # Audio visualizer (cava)
      enableCalendarEvents = true; # Calendar integration (khal)
      plugins = {
        catWidget.enable = true;
      };
    };
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        # Add any missing dynamic libraries for unpackaged programs
        # here, NOT in environment.systemPackages
      ];
    };
  };
}
