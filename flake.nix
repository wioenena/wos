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
    grub2-themes = {
      url = "github:vinceliuice/grub2-themes";
    };
    elephant.url = "github:abenz1267/elephant";
    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
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
      allowUnfreePredicate = pkg: builtins.elem (builtins.getAttr "pname" pkg) allowedUnfreePkgNames;
      wosOverlays = import ./overlays { };
      overlays = [
        wosOverlays.gnomeExtensions
      ];
    in
    {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
        };
        modules = [
          {
            nixpkgs.overlays = overlays;
            nixpkgs.config.allowUnfreePredicate = allowUnfreePredicate;
          }

          inputs.nix-flatpak.nixosModules.nix-flatpak
          inputs.grub2-themes.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.wioenena = ./modules/home-manager/wioenena/home.nix;

            home-manager.sharedModules = [
              inputs.zen-browser.homeModules.default
              inputs.walker.homeManagerModules.default
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
