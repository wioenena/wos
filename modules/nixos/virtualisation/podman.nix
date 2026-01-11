{ pkgs, lib, ... }:
{
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  systemd.sockets.podman.wantedBy = lib.mkForce [ ];

  environment.systemPackages = [
    pkgs.podman-compose
  ];

  users.users.wioenena.extraGroups = [ "podman" ];
}
