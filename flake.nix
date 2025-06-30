{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager?ref=release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      flake-utils,
      ...
    }:
    let
      localSystem = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${localSystem};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${localSystem};
      wosCfg = import ./config.nix {
        lib = pkgs.lib;
        inherit pkgs;
      };
    in
    {
      nixosConfigurations.${wosCfg.host} = nixpkgs.lib.nixosSystem {
        system = localSystem;
        specialArgs = {
          inherit inputs wosCfg pkgs-unstable;
        };

        modules = [
          ./hosts/${wosCfg.host}/configuration.nix
          ./common
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${wosCfg.user.username} = ./users/${wosCfg.user.username}/home.nix;
            home-manager.extraSpecialArgs = { inherit wosCfg pkgs-unstable; };
          }
        ];
      };
    }
    // flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        formatter = pkgs.nixfmt-rfc-style;
      }
    );
}
