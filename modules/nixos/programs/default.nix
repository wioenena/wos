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
    btop
    fastfetch
    jq
    playerctl
    stow
    unzip
    alacritty
    grim
    slurp

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

    # VSCode
    vscode

    # Zed editor
    zed-editor

    # JetBrains Toolbox
    jetbrains-toolbox

    # Yaak
    yaak

    # Cava
    cava

    # Clock-RS
    clock-rs

    # Github CLI
    gh

    # Brave
    brave

    # Davinci Resolve
    davinci-resolve
  ];
}
