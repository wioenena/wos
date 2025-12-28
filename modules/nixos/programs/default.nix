{ inputs, pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  imports = [
    ./fish
    ./git.nix
    ./nix-ld.nix
    ./steam.nix
    ./niri.nix
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
    kdeconnect.enable = true;
    waybar.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Common
    coreutils
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
    pls
    xwayland-satellite
    playerctl
    alacritty
    swaylock
    walker

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

    # Awww
    inputs.awww.packages.${system}.awww

    # Switcheroo
    switcheroo

    # Curtail
    curtail

    # Eyedropper
    eyedropper

    # Brave
  ];
}
