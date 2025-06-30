{ lib, ... }:
{
  services.openssh = {
    enable = true;
    ports = [ 22 ];
  };
  systemd.services.sshd.wantedBy = lib.mkForce [ ];
}
