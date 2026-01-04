{ pkgs, lib, ... }:
{
  imports = [
    ./podman.nix
    ./waydroid.nix
  ];

  virtualisation.libvirtd.enable = true;
  systemd.services.libvirtd.wantedBy = lib.mkForce [ ];
  systemd.sockets.libvirtd.wantedBy = lib.mkForce [ ];
  environment.systemPackages = with pkgs; [
    dnsmasq
  ];
  users.users.wioenena.extraGroups = [ "libvirtd" ];
}
