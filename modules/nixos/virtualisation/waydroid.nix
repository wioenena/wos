{ pkgs, lib, ... }:
{
  virtualisation.waydroid = {
    enable = true;
    package = pkgs.waydroid-nftables;
  };
  systemd.services.waydroid-container.wantedBy = lib.mkForce [ ];
}
