{
  description = "wioenena nixos setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-unstable,
      ...
    }:
    let
      system = "x86_64-linux";
      allowedUnfreePkgNames = builtins.fromJSON (builtins.readFile ./allowed-unfree-pkgs.json);
      allowUnfreePredicate = pkg: builtins.elem (builtins.getAttr "pname" pkg) allowedUnfreePkgNames;
      overlay = import ./overlay;
      cfg = import ./config.nix;

      pkgs = import nixpkgs {
        inherit system;
        overlays = [ overlay ];
        config.allowUnfreePredicate = allowUnfreePredicate;
      };

      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        overlays = [ overlays ];
        config.allowUnfreePredicate = allowUnfreePredicate;
      };
    in
    {
      nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
        inherit pkgs;

        specialArgs = {
          inherit
            inputs
            pkgs-unstable
            cfg
            ;
        };

        modules = [
          ./hosts/desktop
          ./modules/nixos
        ];
      };
    };
}
