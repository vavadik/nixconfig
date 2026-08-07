{ pkgs, ... }:

{
  programs = {
    steam = {
      enable = true;
      package = pkgs.steam.override {
        extraPkgs =
          pkgs: with pkgs; [
            capitaine-cursors
          ];
      };
    };
  };

}
