{ inputs, pkgs-unstable, ... }:
{
  programs.nix-ld = {
    enable = true;
    libraries = [ ];
  };
}
