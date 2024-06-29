{ pkgs, ... }:
{
  home.packages = with pkgs; [
    discord
    xwaylandvideobridge
  ];
}
