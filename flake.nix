{
  description = "wioenena nixos setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
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
    elephant.url = "github:abenz1267/elephant";
    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      allowedUnfreePkgNames = import ./allowed-unfree-pkgs.nix;
      allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) allowedUnfreePkgNames;
      wosOverlays = import ./overlays { };
      overlays = [
        wosOverlays.gnomeExtensions
      ];
      pkgs-unstable = import inputs.nixpkgs-unstable {
        inherit system;
        overlays = overlays;
      };
    in
    {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs pkgs-unstable;
        };
        modules = [
          {
            nixpkgs.overlays = overlays;
            nixpkgs.config.allowUnfreePredicate = allowUnfreePredicate;
          }

          inputs.walker.nixosModules.walker
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.wioenena = ./modules/home-manager/wioenena/home.nix;

            home-manager.sharedModules = [
              inputs.zen-browser.homeModules.default
            ];
            home-manager.extraSpecialArgs = { inherit inputs pkgs-unstable; };
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
