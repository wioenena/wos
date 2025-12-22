{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wineWowPackages.stableFull
    wineWowPackages.waylandFull
    winetricks
  ];
}
