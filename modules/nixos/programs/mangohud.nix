{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.mangohud
    pkgs.mangojuice
  ];
}
