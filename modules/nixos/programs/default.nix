{ pkgs, ... }:
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
    niri = {
      enable = true;
      useNautilus = true;
    };
    starship.enable = true;
    tmux.enable = true;
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  environment.systemPackages = [
    # Bottles
    (pkgs.bottles.override {
      removeWarningPopup = true;
    })

    # Heroic Games Launcher
    pkgs.heroic

    # Lutris
    pkgs.lutris

    # Mangohud
    pkgs.mangohud
    pkgs.mangojuice

    # Btop
    pkgs.btop

    # Wine
    pkgs.wineWowPackages.stableFull
    pkgs.wineWowPackages.waylandFull
    pkgs.winetricks
  ];
}
