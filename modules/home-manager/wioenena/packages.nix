{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    jetbrains-toolbox
    swaynotificationcenter
    fzf

    # Fonts
    nerd-fonts.jetbrains-mono
    jetbrains-mono
  ];
}
