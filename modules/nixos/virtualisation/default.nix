{ pkgs, lib, ... }:
{
  imports = [
    ./podman.nix
    ./waydroid.nix
  ];

  virtualisation.libvirtd.enable = true;
  environment.systemPackages = with pkgs; [
    dnsmasq
  ];
  systemd.services.libvirtd.wantedBy = lib.mkForce [ ];
  systemd.sockets.libvirtd.wantedBy = lib.mkForce [ ];
}
