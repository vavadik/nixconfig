# General shell/layout settings. See config/home/dotfiles/niri/config.kdl's
# top-level `layout { }` block for the niri source this was migrated from.
{ ... }: {
  programs.umbriel.settings = {
    general = {
      autostart = [ "noctalia" ];
      show_cheatsheet = false;
    };

    layout = {
      gap = 5;
      # Matches niri's `default-column-width { proportion 0.5; }`.
      scrolling = {
        default_width_fraction = 0.5;
        center_underfull_strip = false;
      };
      width_presets = [
        0.333
        0.5
        0.667
      ];
    };
    animation = {
      enabled = true;
      duration_ms = 250;
      # curve = "easeout";
      scratchpad = {
        enabled = true;
        duration_ms = 250;
        curve = "easeout";
        dim = 0.5; # 0.0-1.0
        blur = true; # requires appearance.blur.enabled
        scale = 0.0; # 0 preserves geometry; 0.1-1.0 sizes and centers on entry
        maximize = true; # maximize to edges on entry
        fullscreen = false; # fullscreen on entry
      };
    };
  };

}
