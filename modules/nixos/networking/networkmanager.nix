{ ... }:
{
  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
    ensureProfiles.profiles = {
      "Wired Connection 1" = {
        connection = {
          id = "Wired connection 1";
          interface-name = "enp10s0";
          type = "ethernet";
        };
        ipv4 = {
          method = "auto";
          ignore-auto-dns = true;
          dns = "1.1.1.1;1.0.0.1;";
        };
        ipv6 = {
          method = "disable";
        };
      };
    };
  };

  users.users.wioenena.extraGroups = [ "networkmanager" ];
}
