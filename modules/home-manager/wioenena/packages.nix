{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty

    # Fonts
    nerd-fonts.jetbrains-mono
  ];
}
