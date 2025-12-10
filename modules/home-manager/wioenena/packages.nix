{ inputs, pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  home.packages = with pkgs; [
    jetbrains-toolbox
    wl-clipboard
    inputs.awww.packages.${system}.awww

    # Fonts
    nerd-fonts.jetbrains-mono
    jetbrains-mono
  ];
}
