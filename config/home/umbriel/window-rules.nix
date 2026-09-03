# Cloned from niri's config/home/dotfiles/niri/dms/windowrules.kdl.
#
# umbriel's match.app_id/match.title are regexes (as niri's were), and
# open-on-output/open-fullscreen/open-floating become
# default_output/default_fullscreen/default_floating; background-effect blur
# becomes the runtime `blur` field.
{ ... }: {
  programs.umbriel.settings.window_rule = [
    {
      match.app_id = "re.sonny.Junction$";
      default_floating = true;
    }
    {
      # Matches all games run through Steam Proton.
      match.app_id = "^steam_app_\\d+$";
      # Replace with your exact monitor name from `noctalia msg status` (or
      # the `output` names in ./output.nix) if this stops matching a real
      # output.
      default_output = "DP-2";
      # Force games to launch fullscreen/not floating.
      default_fullscreen = true;
      default_floating = false;
    }
    {
      # niri OR'd four separate `match app-id=...` lines in one rule;
      # umbriel's match.app_id is a single regex, so the four patterns are
      # combined with alternation instead.
      match.app_id = "^slack$|^steam$|^teams-for-linux$|^org\\.telegram\\.desktop$";
      default_output = "HDMI-A-3";
    }
    {
      match.app_id = "^$";
      match.title = "^$";
      default_floating = true;
    }
    {
      match.app_id = "^com.gabm.satty$";
      default_floating = true;
    }
    {
      match.app_id = "^com.mitchellh.ghostty$";
      blur = true;
    }
    {
      match.app_id = "^dev.noctalia.UmbrielSharePicker$";
      default_floating = true;
    }
  ];
}
