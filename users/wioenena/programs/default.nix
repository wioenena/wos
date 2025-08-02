{
  wosPkgs,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  imports = [
    ./hyprland
    ./waybar
    ./zed-editor
    ./vscode
    ./kitty.nix
    ./git.nix
    ./brave.nix
    ./zen-browser.nix
    ./direnv.nix
    ./jetbrains-toolbox.nix
    #    ./astal.nix
  ];

  home.packages = with pkgs; [
    # Apps
    discord
    obsidian

    # Sound
    pavucontrol

    # Terminals
    cool-retro-term # Fun terminal

    # Image viewer
    feh
    viu

    # API Tools
    postman

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
    unzip
    wosPkgs."7zip"

    # Nix language server
    nixd

    vlc # Video player

    # Wayland
    wl-clipboard
    pkgs-unstable.walker

    # Fonts
    noto-fonts
    noto-fonts-cjk-sans
    font-awesome

    # VPN
    protonvpn-gui
  ];
}
