{
  description = "wioenena nixos setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils = {
      url = "github:numtide/flake-utils";
    };

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
      username = "wioenena";
      system = "x86_64-linux";
      allowedUnfreePkgs = builtins.fromJSON (builtins.readFile ./allowed-unfree-pkgs.json);
      allowUnfreePredicate = pkg: builtins.elem (builtins.getAttr "pname" pkg) allowedUnfreePkgs;
      overlays = import ./overlays {};

      pkgs = import nixpkgs {
        inherit system;
        overlays = [overlays];
        config.allowUnfreePredicate = allowUnfreePredicate;
      };

      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        overlays = [overlays];
        config.allowUnfreePredicate = allowUnfreePredicate;
      };
    in
    {
      inherit overlays;
      nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
        inherit pkgs system;
        specialArgs = {
          inherit
            inputs
            username
            pkgs-unstable
            ;
        };

        modules = [
          ./hosts/desktop/default.nix
        ];
      };
    }
    // inputs.flake-utils.lib.eachDefaultSystem (system: {
      formatter = pkgs.nixfmt-rfc-style;
    });
}
