{ inputs, pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  home.packages = with pkgs; [
    jetbrains-toolbox
    wl-clipboard
    inputs.awww.packages.${system}.awww
    broot
    feh
    yt-dlp
  ];
}
