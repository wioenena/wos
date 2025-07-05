{ pkgs, ... }:
{
  imports = [
    ./hyprland
    ./waybar
    ./zed-editor
    ./kitty.nix
    ./git.nix
    ./brave.nix
    #    ./astal.nix
  ];

  home.packages = with pkgs; [
    # Sound
    pavucontrol

    # Terminals
    cool-retro-term # Fun terminal

    # Editors
    lapce

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
    jq
    neofetch
    wget
    curl
    xdg-user-dirs
    kdePackages.kdeconnect-kde

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
