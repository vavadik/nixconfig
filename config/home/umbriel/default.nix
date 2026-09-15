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

  programs.mangohud = {
    enable = true;
    settings = {
      fps = true;
      gpu_stats = false;
      cpu_stats = false;
      core_load = false;
      font_size = 24;
      position = "top-right";
    };
  };

}
