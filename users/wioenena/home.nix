{
  wosCfg,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [
    ./services
    ./programs
    ./dconf.nix
    ./gtk.nix
    inputs.zen-browser.homeModules.beta
  ];

  home.username = wosCfg.user.username;
  home.homeDirectory = "/home/${wosCfg.user.username}";

  home.packages = wosCfg.user.home.packages;

  programs.home-manager.enable = true;

  home.stateVersion = wosCfg.home.stateVersion;
}
