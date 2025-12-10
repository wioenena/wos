{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    jetbrains-toolbox
    swaynotificationcenter

    # Fonts
    nerd-fonts.jetbrains-mono
  ];
}
