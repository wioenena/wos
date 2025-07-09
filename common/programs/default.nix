{ pkgs-unstable, ... }:
{
  imports = [
    ./editors.nix
    ./fish.nix
    ./hyprland.nix
    ./homeManager.nix
    ./dconf.nix
    ./nix-ld.nix
  ];
}
