{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager?ref=release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
      allowUnfreePredicate =
        pkg:
        builtins.elem (builtins.getAttr "pname" pkg) [
          "spotify"
          "vscode"
          "discord"
          "cloudflare-warp"
          "postman"
          "obsidian"
          "jetbrains-toolbox"
        ];

      localSystem = "x86_64-linux";

      pkgs = import nixpkgs {
        system = localSystem;
        config.allowUnfreePredicate = allowUnfreePredicate;
      };
      pkgs-unstable = import nixpkgs-unstable {
        system = localSystem;
        config.allowUnfreePredicate = allowUnfreePredicate;
      };

      wosCfg = import ./config.nix {
        inherit pkgs;
      };
      wosPkgs = import ./wos-pkgs { inherit pkgs; };
    in
    {
      nixosConfigurations.${wosCfg.host} = nixpkgs.lib.nixosSystem {
        inherit pkgs;

        system = localSystem;
        specialArgs = {
          inherit
            inputs
            wosCfg
            wosPkgs
            pkgs-unstable
            ;
        };

        modules = [
          ./hosts/${wosCfg.host}/configuration.nix
          ./common
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${wosCfg.user.username} = ./users/${wosCfg.user.username}/home.nix;
            home-manager.extraSpecialArgs = {
              inherit
                inputs
                wosCfg
                wosPkgs
                pkgs-unstable
                ;
            };
          }
        ];
      };

      templates = {
        common = {
          path = ./flake-templates/common;
          description = "Common flake";
        };

        development = {
          path = ./flake-templates/development;
          description = "Flake for development";
        };
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
