{
  wosCfg,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./services
    ./programs
    ./dconf.nix
    ./gtk.nix
  ];

  home.username = wosCfg.user.username;
  home.homeDirectory = "/home/${wosCfg.user.username}";

  home.packages = wosCfg.user.home.packages;

  programs.home-manager.enable = true;

  home.stateVersion = wosCfg.home.stateVersion;
}
