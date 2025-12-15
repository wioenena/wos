{
  description = "wioenena nixos setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    awww.url = "git+https://codeberg.org/LGFae/awww";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    zed-editor.url = "github:zed-industries/zed";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nix-flatpak,
      zen-browser,
      zed-editor,
      ...
    }:
    let
      system = "x86_64-linux";
      allowedUnfreePkgNames = import ./allowed-unfree-pkgs.nix;
      allowUnfreePredicate = pkg: builtins.elem (builtins.getAttr "pname" pkg) allowedUnfreePkgNames;
      wosOverlays = import ./overlays { };
      overlays = [
        wosOverlays.gnomeExtensions
        wosOverlays.zed-editor {inherit zed-editor system;}
      ];

      pkgs = import nixpkgs {
        inherit system overlays;
        config.allowUnfreePredicate = allowUnfreePredicate;
        packages.${system}.zed-editor-latest = zed-editor.packages.${system}.default;
      };

      pkgs-unstable = import nixpkgs-unstable {
        inherit system overlays;
        config.allowUnfreePredicate = allowUnfreePredicate;
      };
    in
    {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        inherit pkgs;

        specialArgs = {
          inherit
            inputs
            pkgs-unstable
            ;
        };

        modules = [
          nix-flatpak.nixosModules.nix-flatpak
          ./hosts/desktop
          ./modules/nixos
        ];
      };

      homeConfigurations.wioenena = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          zen-browser.homeModules.default
          ./modules/home-manager/wioenena/home.nix
        ];
        extraSpecialArgs = { inherit inputs pkgs-unstable; };
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
