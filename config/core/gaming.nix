{ pkgs, ... }:

{
  programs = {
    steam = {
      enable = true;
      extraPackages = with pkgs; [
        capitaine-cursors
      ];
    };
  };

}
