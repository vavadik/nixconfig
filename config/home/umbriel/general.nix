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
        default_width_fraction = 0.499;
        center_underfull_strip = false;
      };
      width_presets = [
        0.333
        0.499
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

    appearance = {
      prefer_no_csd = true;
      border_width = 2; # 0-100
      outer_border_width = 0; # 0-100
      corner_radius = 10; # 0-100, final outer edge; 0 disables
      drag_opacity = 0.75;

      shadow = {
        enabled = true;
        softness = 10; # 0-200
        offset_x = 2; # -200 to 200
        offset_y = 2;
      };
    };

    colors = {
      insert_hint = "#7FC8FF80";
      backdrop = "#000000FF";
      shadow = "#0000007F";

      border = {
        focused = "#7AA3FFFF"; # #RRGGBB or #RRGGBBAA
        unfocused = "#292933FF";
        scratchpad_focused = "#E5C07BFF";
        scratchpad_unfocused = "#5C4A2AFF";
        outer = "#1A1A1FFF";
      };
    };
  };

}
