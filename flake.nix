{
  description = "wioenena nixos setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    systems.url = "github:nix-systems/x86_64-linux";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
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
      localSystem = builtins.elemAt (import inputs.systems) 0;
      allowUnfreePredicate =
        pkg:
        builtins.elem (builtins.getAttr "pname" pkg) [
          "vscode"
          "jetbrains-toolbox"
        ];

      pkgs = import nixpkgs {
        system = localSystem;
        config.allowUnfreePredicate = allowUnfreePredicate;
      };

      pkgs-unstable = import nixpkgs-unstable {
        system = localSystem;
        config.allowUnfreePredicate = allowUnfreePredicate;
      };

      custom-pkgs = import ./custom-pkgs { inherit pkgs; };

    in
    {
      nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
        inherit pkgs;

        system = localSystem;
        specialArgs = {
          inherit
            inputs
            username
            pkgs-unstable
            custom-pkgs
            ;
        };

        modules = [
          ./configuration.nix
          ./common
        ];
      };
    }
    // inputs.flake-utils.lib.eachDefaultSystem (system: {
      formatter = pkgs.nixfmt-rfc-style;
    });
}
