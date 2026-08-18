{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    heroic
  ];

  programs = {
    gamescope = {
      enable = true;
    };
    gamemode = {
      enable = true;
    };
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
