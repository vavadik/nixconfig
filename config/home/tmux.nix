{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    extraConfig = ''
      bind _ split-window -v
      bind + split-window -h
      unbind '"'
      unbind %
      set -g default-command fish
      set -g set-clipboard on
      # Copy to Wayland clipboard
      bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel "wl-copy"
      bind-key -T copy-mode-vi Enter send -X copy-pipe-and-cancel "wl-copy"
    '';
  };
}
