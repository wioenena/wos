{ inputs, pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  environment.systemPackages = with pkgs; [
    # Programs
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
    wl-clipboard
    feh
    yt-dlp
    home-manager
    discord
    fd
    fzf
    git
    kitty
    obs-studio
    obsidian
    satty
    vscode
    zed-editor
    protonvpn-gui
    pavucontrol
    amberol
    binary
    curtail
    eyedropper
    impression
    keypunch
    resources
    gnome-solanum
    kooha
    gnome-decoder
    spotify
    ## JetBrains Apps
    jetbrains.rider
    jetbrains.idea
    jetbrains.clion
    jetbrains.goland
    jetbrains.datagrip
    jetbrains.rust-rover
    inputs.awww.packages.${system}.awww

    # Libs
    libnotify
    gtk2
    gtk3
    gtk4
    (pkgs.ffmpeg-full.override {
      withMetal = false;
      withUnfree = true;
      withDebug = false;
    })

    # Filesystem utilities
    dosfstools
    exfatprogs
    e2fsprogs
    btrfs-progs
    ntfs3g
  ];
}
