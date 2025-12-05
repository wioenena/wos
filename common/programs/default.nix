{ inputs, ... }:
{
  imports = [
    ./dconf.nix
    ./docker.nix
    ./editors.nix
    ./fish.nix
    ./home-manager.nix
    ./nix-ld.nix
    ./tools.nix
  ];
}
