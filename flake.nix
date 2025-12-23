{
  description = "wioenena nixos setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    awww.url = "git+https://codeberg.org/LGFae/awww";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    stylix.url = "github:nix-community/stylix/release-25.11";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nix-flatpak,
      zen-browser,
      stylix,
      ...
    }:
    let
      system = "x86_64-linux";
      allowedUnfreePkgNames = import ./allowed-unfree-pkgs.nix;
      allowUnfreePredicate = pkg: builtins.elem (builtins.getAttr "pname" pkg) allowedUnfreePkgNames;
      wosOverlays = import ./overlays { };
      overlays = [
        wosOverlays.gnomeExtensions
      ];

      pkgs = import nixpkgs {
        inherit system overlays;
        config.allowUnfreePredicate = allowUnfreePredicate;
      };
    in
    {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        specialArgs = {
          inherit inputs;
        };
        modules = [
          nix-flatpak.nixosModules.nix-flatpak
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.wioenena = ./modules/home-manager/wioenena/home.nix;

            home-manager.sharedModules = [
              stylix.homeModules.stylix
              zen-browser.homeModules.default
            ];
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
          ./hosts/desktop
          ./modules/nixos
        ];
      };
    }
    // inputs.flake-utils.lib.eachSystem [ "x86_64-linux" ] (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        formatter = pkgs.nixfmt-rfc-style;
      }
    );
}
