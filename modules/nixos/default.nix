{ ... }:
{
  imports = [
    ./networking
    ./programs
    ./services
    ./security
    ./virtualisation
    ./specialisations
    ./amdgpu.nix
    ./audio.nix
    ./boot.nix
    ./console.nix
    ./documentation.nix
    ./firmware.nix
    ./fonts.nix
    ./hardware.nix
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
