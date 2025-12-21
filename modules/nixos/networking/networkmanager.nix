{ ... }:
{
  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
    settings = {
      connectivity = {
        uri = "https://nmcheck.gnome.org/";
      };
    };
  };

  users.users.wioenena.extraGroups = [ "networkmanager" ];
}
