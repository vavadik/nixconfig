{
  description = "Vadim's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";

      # Edit these — passed to NixOS and Home Manager modules as `user`.
      user = {
        name = "vadim";
        fullName = "Vadim";
        email = "vadim@example.com";
      };

      configuration = ./configuration.nix;
      hardwareConfig = ./hardware-configuration.nix;
      core = ./config/core;

      modules = [
        configuration
        hardwareConfig
        home-manager.nixosModules.home-manager
        core
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${user.name} = import ./config/home;
            backupFileExtension = "backup";
            extraSpecialArgs = { inherit user; };
          };
        }
      ];
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit user; };
        inherit modules;
      };
    };
}
