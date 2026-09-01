{ inputs, ... }: {
  imports = [
    inputs.umbriel.homeModules.default
    ./general.nix
    ./input.nix
    ./output.nix
    ./window-rules.nix
    ./keybinds.nix
  ];

  programs.umbriel.enable = true;
}
