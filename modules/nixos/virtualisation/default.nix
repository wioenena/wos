{ ... }:
{
  imports = [ ./podman.nix ];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
