{ inputs, ... }:
{
  imports = [
    ./amdgpu.nix
    ./audio.nix
    ./boot.nix
    ./documentation.nix
    ./environment.nix
    ./firmware.nix
    ./hardware.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./users.nix
  ];
}
