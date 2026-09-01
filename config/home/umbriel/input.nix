# Migrated verbatim from niri's `input.keyboard` / `input.touchpad` blocks
# in config/home/dotfiles/niri/config.kdl.
{ ... }: {
  programs.umbriel.settings.input = {
    keyboard = {
      layout = "us,ru";
      variant = ",ruu";
      options = "grp:caps_toggle,lv3:ralt_switch";
      numlock_toggle = true;
    };
    touchpad = {
      tap = true;
      natural_scroll = true;
    };
  };
}
