{ pkgs, user, ... }:

{
  home = {
    stateVersion = "26.05";

    packages = with pkgs; [
      fzf
      lsd
      zoxide
    ];
  };
}
