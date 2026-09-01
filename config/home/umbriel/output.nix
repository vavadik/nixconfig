# Migrated from the live DMS-generated ~/.config/niri/dms/outputs.kdl
# (config.kdl's own /-output block was only a commented-out example and was
# not the active output config).
{ ... }: {
  programs.umbriel.settings.output = {
    "DP-2" = {
      mode = "2560x1440@239.765";
      scale = 1;
      position = [ 0 0 ];
      # niri used `variable-refresh-rate on-demand=true`, which has no exact
      # equivalent (umbriel only has disabled/always/fullscreen).
      # "fullscreen" is the closest match -- verify this is what you want.
      vrr = "fullscreen";
    };
    "HDMI-A-3" = {
      mode = "2560x1440@143.855";
      scale = 1;
      position = [ 2560 0 ];
    };
  };
}
