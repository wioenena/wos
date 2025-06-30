{ pkgs, ... }:
{
  imports = [
    ./hyprland
    ./kitty.nix
    ./git.nix
    ./brave.nix
  ];

  home.packages = with pkgs; [
    # Sound
    pavucontrol

    # Terminals
    cool-retro-term # Fun terminal

    # Editors
    lapce
    zed-editor

    feh # Image viewer
    viu # Image viewer

    # Notification
    libnotify

    # Music
    spotify

    # Tools
    xdg-user-dirs
    file

    # Nix language server
    nixd

    vlc # Video player
  ];
}
