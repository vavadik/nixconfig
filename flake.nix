{
  description = "Vadim's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nix-index-database,
      ...
    }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };

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
        # Make pkgs.unstable available everywhere
        ({ pkgs, ... }: {
          nixpkgs.overlays = [
            (final: prev: {
              unstable = import nixpkgs-unstable {
                inherit (final.stdenv.hostPlatform) system;
                config.allowUnfree = true;
              };
            })
          ];

          nixpkgs.config.allowUnfree = true;
        })

        configuration

        hardwareConfig

        core

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${user.name} = import ./config/home;
            backupFileExtension = "backup";
            extraSpecialArgs = { inherit user; };
          };
        }

        nix-index-database.nixosModules.nix-index
      ];
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit user inputs; };
        inherit modules;
      };
    };
}
