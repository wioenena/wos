{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  programs = {
    walker.enable = true;
  };

  environment.systemPackages = with pkgs; [
    waybar
    nwg-look
  ];
}
