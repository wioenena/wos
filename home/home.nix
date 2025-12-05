{
  inputs,
  username,
  pkgs,
  ...
}:

{
  imports = [
    ./programs
    ./gtk.nix
    inputs.zen-browser.homeModules.default
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
