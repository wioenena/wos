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
    ./dconf.nix
    ./neovim.nix
    ./hyprland.nix
  ];

  programs = {
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
        prettybat
      ];
    };
    direnv = {
      enable = true;
      loadInNixShell = true;
      nix-direnv.enable = true;
      enableFishIntegration = true;
    };
    htop.enable = true;
    less.enable = true;
    nano.enable = true;
    starship.enable = true;
    tmux.enable = true;
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    fzf = {
      keybindings = true;
      fuzzyCompletion = true;
    };
    virt-manager.enable = true;
    dankMaterialShell.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Terminal-Based
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
    btop
    fastfetch
    jq
    playerctl
    stow
    unzip
    grim
    slurp

    # GUI
    pavucontrol
    alacritty
    (bottles.override {
      removeWarningPopup = true;
    })
    heroic
    lutris
    mangohud
    prismlauncher
    wineWowPackages.stableFull
    wineWowPackages.waylandFull
    winetricks
    vscode
    zed-editor
    jetbrains-toolbox
    yaak
    cava
    clock-rs
    gh
    brave
    davinci-resolve
    discord
    bleachbit
    curtail
    easyeffects
    eyedropper
    gimp
    goverlay
    handbrake
    identity
    kooha
    mousai
    mpv
    obs-studio
    obsidian
    switcheroo
    textpieces
    thunderbird
    vlc
    postman
    pinta
    czkawka
    devtoolbox
    imhex
    localsend
    upscayl
    gnome-tweaks
    shotcut
  ];
}
