{ inputs, ... }:
{

  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;

    settings = {
      # This may also be a string or path to a .toml file.
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Catppuccin";
      };

      location = {
        auto_locate = true;
      };

      audio = {
        enable_sounds = true; # master toggle for UI sounds
      };

      bar = {
        default = {
          margin_ends = 0;

          start = [
            "launcher"
            "wallpaper"
            "workspaces"
          ];
          center = [
            "weather"
            "media"
            "clock"
          ];
          end = [
            "tray"
            "notifications"
            "clipboard"
            "network"
            "bluetooth"
            "volume"
            "control-center"
            "session"
          ];
        };
      };

      widget = {
        media = {
          hide_when_no_media = true;
        };
        weather = {
          max_length = 180;
          show_condition = false;
          show_temperature = true;
        };
      };

      dock = {
        enabled = true;
        smart_auto_hide = true;
        reserve_space = false;
        show_dots = true;

        active_scale = 1.15; # icon scale for the focused app (clamped 0.1–1.75)
        inactive_scale = 1; # icon scale for non-focused apps (clamped 0.1–1.0)
      };

      wallpaper = {
        enabled = true;
        # default.path = "/path/to/wallpapers/wallpaper.png";
      };

      shell = {
        screenshot = {
          save_to_file = true; # write captures as PNG to the output directory
          directory = "~/Pictures/Screenshots"; # output folder; empty = XDG_PICTURES_DIR or ~/Pictures
          filename_pattern = ""; # empty = screenshot_%Y%m%d_%H%M%S
          copy_to_clipboard = false; # also place the PNG on the clipboard
          freeze_screen = true; # freeze the desktop before region selection
          confirm_region = true; # confirm region captures with Enter or Space
          remember_last_region = false; # pre-select the last region (also after cancel)
          show_cursor = false; # include the mouse pointer in captures
          pipe_to_command = true; # pipe the PNG to a shell command on stdin
          pipe_command = "satty -f - --early-exit --disable-notifications";
        };
      };
    };
  };
}
