{ ... }:
{
  imports = [
    ./networking
    ./programs
    ./services
    ./security
    ./virtualisation
    ./specialisations
    ./audio.nix
    ./boot.nix
    ./console.nix
    ./documentation.nix
    ./firmware.nix
    ./fonts.nix
    ./locale.nix
    ./nix.nix
    ./packages.nix
    ./time.nix
    ./users.nix
    ./xdg.nix
    ./zram.nix
    ./displayManager.nix
    ./gnome.nix
  ];
}
