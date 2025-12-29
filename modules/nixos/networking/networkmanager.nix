{ ... }:
{
  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
  };

  users.users.wioenena.extraGroups = [ "networkmanager" ];
}
