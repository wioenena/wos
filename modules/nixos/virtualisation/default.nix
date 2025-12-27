{ ... }:
{
  imports = [
    ./podman.nix
    ./waydroid.nix
  ];

  virtualisation.libvirtd.enable = true;
}
