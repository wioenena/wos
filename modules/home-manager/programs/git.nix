{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "wioenena";
      user.email = "wioenena";
    };
  };
}
