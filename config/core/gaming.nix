{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    heroic
  ];

  services.udev.extraRules = ''
    # DualSense touchpad - USB
    ACTION=="add|change", ATTRS{name}=="Sony Interactive Entertainment DualSense Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  '';

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
