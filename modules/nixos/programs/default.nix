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
    ./dconf
    ./git.nix
    ./nix-ld.nix
    ./steam.nix
    ./neovim.nix
  ];

  programs = {
    bat.enable = true;
    bat.extraPackages = with pkgs.bat-extras; [
      batdiff
      batman
      prettybat
    ];

    direnv.enable = true;
    direnv.loadInNixShell = true;
    direnv.nix-direnv.enable = true;
    direnv.enableFishIntegration = true;

    htop.enable = true;
    less.enable = true;
    nano.enable = true;
    starship.enable = true;
    tmux.enable = true;

    zoxide.enable = true;
    zoxide.enableFishIntegration = true;

    fzf.keybindings = true;
    fzf.fuzzyCompletion = true;
    localsend.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # --- Core System Utilities (GNU Standard) ---
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
    psmisc
    dateutils

    # --- Modern CLI Tools (Better Alternatives) ---
    ripgrep
    eza
    fzf
    btop
    jq
    tree
    stow

    # --- Networking & Download ---
    wget
    curl
    rsync
    yt-dlp

    # --- Wayland Desktop Environment Utilities ---
    wl-clipboard
    grim
    slurp
    nwg-look
    playerctl

    # --- Development & Editors ---
    alacritty
    vscode
    zed-editor
    jetbrains-toolbox
    yaak
    gh

    # --- Web Browsing ---
    brave

    # --- Ricing & Visuals ---
    feh
    fastfetch
    cava
    clock-rs

    # --- Nix & System Management ---
    home-manager

    # --- Flake Inputs (Custom Packages) ---
    inputs.awww.packages.${system}.awww
    inputs.matugen.packages.${system}.default
  ];
}
