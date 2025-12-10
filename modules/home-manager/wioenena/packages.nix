{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    jetbrains-toolbox

    # Fonts
    nerd-fonts.jetbrains-mono
  ];
}
