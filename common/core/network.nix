{ wosCfg, ... }:
{
  networking = {
    hostName = "nixos";

    firewall = {
      enable = true;
    };

    networkmanager.enable = true;
    useDHCP = false;
    dhcpcd.enable = true;

  };

  users.users.${wosCfg.user.username}.extraGroups = [ "networkmanager" ];
}
