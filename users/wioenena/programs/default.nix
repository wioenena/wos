{ pkgs, ... }:
{
  imports = [
    ./hyprland
    ./waybar
    ./zed-editor
    ./vscode
    ./kitty.nix
    ./git.nix
    ./brave.nix
    ./direnv.nix
    #    ./astal.nix
  ];

  home.packages = with pkgs; [
    # Sound
    pavucontrol

    # Terminals
    cool-retro-term # Fun terminal

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
