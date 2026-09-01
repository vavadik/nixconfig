# General shell/layout settings. See config/home/dotfiles/niri/config.kdl's
# top-level `layout { }` block for the niri source this was migrated from.
{ ... }: {
  programs.umbriel.settings = {
    general.autostart = [ "noctalia" ];

    layout = {
      gap = 5;
      # Matches niri's `default-column-width { proportion 0.5; }`.
      scrolling.default_width_fraction = 0.5;
    };
  };
}
