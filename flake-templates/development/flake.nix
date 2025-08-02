{
  description = "Flake for development";

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
      with pkgs;
      {
        devShells.go = mkShell {
          buildInputs = [
            go
            gopls
          ];
        };

        devShells.nodejs = mkShell {
          buildInputs = [
            nodejs_24
            nodePackages.pnpm
            nodePackages.typescript-language-server
          ];
        };

        devShells.zig = mkShell {
          buildInputs = [
            zig
            zls
          ];
        };

        devShells.deno = mkShell {
          buildInputs = [ deno ];
        };

        formatter = nixfmt-rfc-style;
      }
    );

}
