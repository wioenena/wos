{ inputs, pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  home.packages = with pkgs; [
    kitty
    jetbrains-toolbox
    wl-clipboard
    inputs.awww.packages.${system}.awww
    hyprlauncher

    # Fonts
    nerd-fonts.jetbrains-mono
    jetbrains-mono
  ];
}
