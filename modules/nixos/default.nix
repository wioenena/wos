{ ... }:
{
  imports = [
    ./virtualisation
    ./amdgpu.nix
    ./audio.nix
    ./boot.nix
    ./documentation.nix
    ./firmware.nix
    ./fonts.nix
    ./fs.nix
    ./hardware.nix
    ./locale.nix
    ./nix.nix
    ./packages.nix
    ./time.nix
    ./users.nix
    ./xdg.nix
    ./zram.nix
    ./networking
    ./ui
    ./programs
  ];
}
