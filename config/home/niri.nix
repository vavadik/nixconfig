{ pkgs, ... }:

{
  xdg.configFile."niri/config.kdl".source = ./dotfiles/niri/config.kdl;
  xdg.configFile."niri/dms/binds.kdl".source = ./dotfiles/niri/dms/binds.kdl;
  xdg.configFile."niri/dms/windowrules.kdl".source = ./dotfiles/niri/dms/windowrules.kdl;
  xdg.configFile."niri/scripts/toggle-first-window.sh".source =
    ./dotfiles/niri/scripts/toggle-first-window.sh;
}
