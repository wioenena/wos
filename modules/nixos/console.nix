{ pkgs, ... }:
{
  console.keyMap = "us";
  console.font = "${pkgs.kbd}/share/consolefonts/Lat2-Terminus16.psfu.gz";
}
