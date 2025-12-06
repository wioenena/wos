{
inputs,
  pkgs,
  ...
}:

{
  imports = [
    ./programs
    ./gtk.nix
    inputs.zen-browser.homeModules.default
  ];

  home.username = "wioenena";
  home.homeDirectory = "/home/wioenena";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
