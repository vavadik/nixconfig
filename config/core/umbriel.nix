{ inputs, pkgs, ... }: {
  imports = [ inputs.umbriel.nixosModules.default ];

  programs.umbriel.enable = true;
  # umbriel wraps its binary with its own xwayland-satellite on PATH; use ours instead.
  programs.umbriel.package = inputs.umbriel.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
    inherit (pkgs) xwayland-satellite;
  };
}
