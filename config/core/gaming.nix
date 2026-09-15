{ pkgs, inputs, ... }:

{
  disabledModules = [ "programs/gamescope.nix" ];
  imports = [
    "${inputs.nixpkgs-unstable}/nixos/modules/programs/gamescope.nix"
    inputs.eden.nixosModules.default
  ];

  # Unstable module's enableWsi pulls pkgs.gamescope-wsi; keep both on unstable.
  nixpkgs.overlays = [
    (final: prev: {
      gamescope = final.unstable.gamescope;
    })
    inputs.eden.overlays.default
  ];

  environment.systemPackages = with pkgs; [
    heroic
    unstable.mangohud
    vulkan-tools
    ryubing
  ];

  services.udev.extraRules = ''
    # DualSense touchpad - USB
    ACTION=="add|change", ATTRS{name}=="Sony Interactive Entertainment DualSense Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  '';

  programs = {
    gamescope = {
      enable = true;
      enableWsi = true;
      capSysNice = false;
    };
    gamemode = {
      enable = true;
    };
    eden = {
      enable = true;
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      package = pkgs.unstable.steam.override {
        extraPkgs =
          pkgs: with pkgs; [
            capitaine-cursors
          ];
      };
    };
  };

}
