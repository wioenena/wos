{
  inputs,
  pkgs,
  pkgs-unstable,
  ...
}:
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
  };

  environment.systemPackages = with pkgs; [
    # Common for linux experience
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
    tree
    ripgrep
    wget
    curl
    psmisc
    feh
    fzf
    btop
    fastfetch
    eza
    ## Common for wayland experience
    wl-clipboard
    grim
    slurp
    ## Tools
    yt-dlp
    jq
    playerctl
    stow
    clock-rs
    cava
    ## Home Manager
    home-manager
    ## For github
    gh

    # GUI
    ## Audio
    pavucontrol
    mousai
    ## Terminal
    alacritty
    ## Gaming & Windows compatibility
    (bottles.override {
      removeWarningPopup = true;
    })
    heroic
    lutris
    prismlauncher
    wineWowPackages.stableFull
    wineWowPackages.waylandFull
    winetricks
    mangohud
    goverlay
    ## Developer experience
    vscode
    zed-editor
    jetbrains-toolbox
    yaak
    postman
    devtoolbox
    eyedropper
    imhex
    ## Browsers
    brave
    ## Contect creator
    davinci-resolve
    gimp
    obs-studio
    pinta
    shotcut
    ## Communication
    discord
    ## Tools
    curtail
    easyeffects
    handbrake
    kooha
    mpv
    switcheroo
    ## Extras
    obsidian
    thunderbird
    vlc
    localsend
    upscayl
    gnome-tweaks

    # For window managers
    quickshell # For dms-shell
    pkgs-unstable.dms-shell
  ];
}
