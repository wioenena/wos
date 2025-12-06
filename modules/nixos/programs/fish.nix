{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    package = pkgs.fish;
  };
}
