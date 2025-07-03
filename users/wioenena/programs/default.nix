{ pkgs, ... }:
{
  imports = [
    ./hyprland
    ./waybar
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
    bat

    # Nix language server
    nixd

    vlc # Video player

    # Wayland
    wl-clipboard

    # Fonts
    noto-fonts
    noto-fonts-cjk-sans
    font-awesome

  ];
}
