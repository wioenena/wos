{ pkgs-unstable, ... }:
{
  programs.git = {
    enable = true;
    userName = "wioenena";
    userEmail = "wioenena@gmail.com";
    package = pkgs-unstable.git;
  };
}
