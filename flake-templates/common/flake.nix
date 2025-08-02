{
  description = "A common flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    {
      nixpkgs-unstable,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs-unstable { inherit system; };
      in
      {
      }
    );

}
