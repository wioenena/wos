{ pkgs, ... }:
{
  imports = [
    ./hyprland
    ./waybar
    ./vscode
    ./neovim
    ./ranger
    ./discord.nix
    ./brave.nix
    ./kitty.nix
    ./cava.nix
    ./obs.nix
    ./git.nix
    ./shell.nix
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
    libarchive
    p7zip
    rar
    zip
    unzip
    colordiff
    lsd
    duf
    ncdu
    xdg-user-dirs
    findutils
    diffutils
    hex
    jq
    emote
    neofetch
    htop
    btop
    bat
    file
    direnv

    # Nix language server
    nixd
  ];
}
