{ inputs, pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  imports = [
    ./fish
    ./niri
    ./hyprland
    ./git.nix
    ./nix-ld.nix
    ./steam.nix
  ];

  programs = {
    bat.enable = true;
    dconf.enable = true;
    direnv = {
      enable = true;
      loadInNixShell = true;
      nix-direnv.enable = true;
      enableFishIntegration = true;
    };
    gamemode.enable = true;
    htop.enable = true;
    less.enable = true;
    nano.enable = true;
    starship.enable = true;
    tmux.enable = true;
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    waybar.enable = true;
    kdeconnect.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Common
    coreutils-full
    gnutar
    findutils
    diffutils
    gnugrep
    gnused
    gawk
    util-linux
    procps
    binutils
    file
    dateutils
    rsync
    eza
    tree
    ripgrep
    wget
    curl
    psmisc
    wl-clipboard
    feh
    yt-dlp
    home-manager
    fzf
    pavucontrol
    kooha
    btop
    fastfetch
    jq
    playerctl
    stow
    unzip
    swaylock
    xwayland-satellite
    alacritty
    swaynotificationcenter
    grim
    slurp
    inputs.awww.packages.${system}.awww
    inputs.walker.packages.${system}.walker

    # Bottles
    (bottles.override {
      removeWarningPopup = true;
    })

    # Heroic Games Launcher
    heroic

    # Lutris
    lutris

    # Mangohud
    mangohud
    mangojuice

    # Prism Launcher
    prismlauncher

    # Wine
    wineWowPackages.stableFull
    wineWowPackages.waylandFull
    winetricks

    # Discord
    discord

    # OBS Studio
    obs-studio

    # Obsidian
    obsidian

    # VSCode
    vscode

    # Zed editor
    zed-editor

    # JetBrains Toolbox
    jetbrains-toolbox

    # ImHex
    imhex

    # Postman
    postman

    # Yaak
    yaak

    # DevToolBox
    devtoolbox

    # Cava
    cava

    # Clock-RS
    clock-rs

    # Github CLI
    gh

    # Switcheroo
    switcheroo

    # Curtail
    curtail

    # Eyedropper
    eyedropper

    # Brave
    brave

    # Davinci Resolve
    davinci-resolve
  ];
}
