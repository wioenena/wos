{ pkgs, pkgs-unstable, ... }:
{
  imports = [
    ./hyprland
  ];

  environment.systemPackages = [
    pkgs.quickshell
    pkgs-unstable.dms-shell
  ];
}
