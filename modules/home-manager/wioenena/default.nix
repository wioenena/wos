{ ... }:
{
  imports = [
    ./programs
    ./services
    ./packages.nix
    ./gtk.nix
    ./xdg.nix
    ./dconf.nix
    ./hyprland.nix
  ];
}
