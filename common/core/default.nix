{ ... }:
{

  imports = [
    ./hardware.nix
    ./boot.nix
    ./audio.nix
    ./locale.nix
    ./network.nix
    ./environment.nix
    ./users.nix
    ./nix.nix
    ./documentation.nix
  ];
}
