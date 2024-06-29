{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      hyprland,
      flake-utils,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      local-pkgs = import ./pkgs { inherit pkgs; };
      host = "wos";
    in
    {
      nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs local-pkgs;
        };
        modules = [
          hyprland.nixosModules.default
          ./hosts/${host}/configuration.nix
          ./system
        ];
      };

      homeConfigurations."wioenena" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          hyprland.homeManagerModules.default
          ./home/home.nix
        ];

        extraSpecialArgs = {
          inherit inputs local-pkgs host;
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
