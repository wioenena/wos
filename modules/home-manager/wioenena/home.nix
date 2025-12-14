{
  inputs,
  ...
}:

{
  imports = [
    ./default.nix
  ];

  home.username = "wioenena";
  home.homeDirectory = "/home/wioenena";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
