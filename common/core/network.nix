{ wosCfg, ... }:
{
  networking = {
    hostName = "nixos";

    firewall = {
      enable = true;
      allowedTCPPorts = [ 8384 ];
      allowedTCPPortRanges = [
        # KDE Connect
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = [
        # KDE Connect
        {
          from = 1714;
          to = 1764;
        }
      ];
    };

    networkmanager.enable = true;
    useDHCP = false;
    dhcpcd.enable = true;

  };

  users.users.${wosCfg.user.username}.extraGroups = [ "networkmanager" ];
}
