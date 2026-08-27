{ pkgs, inputs, ... }:

{
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
  };
}
