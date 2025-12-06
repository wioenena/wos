{
  description = "Home Manager configuration of wioenena";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
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
  };

  outputs =
    inputs@{
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      allowedUnfreePkgNames = import ../../../allowed-unfree-pkgs.nix;
      allowUnfreePredicate = pkg: allowedUnfreePkgNames;
      overlay = import ../../overlay;

      pkgs = import nixpkgs {
        inherit system;
        overlays = [ overlay ];
        config.allowUnfreePredicate = allowUnfreePredicate;
      };

      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        overlays = [ overlay ];
        config.allowUnfreePredicate = allowUnfreePredicate;
      };
    in
    {
      homeConfigurations."wioenena" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];
        extraSpecialArgs = { inherit inputs pkgs-unstable; };

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
