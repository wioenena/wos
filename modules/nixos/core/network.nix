{ inputs, username, ... }:
{
  networking = {
    hostName = "nixos";
    hosts = {
      "127.0.0.1" = [ "localhost" ];
    };

    enableIPv6 = false;

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];

    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
      allowedTCPPortRanges = [ ];
      allowedUDPPortRanges = [ ];
    };

    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      settings = {
        connectivity = {
          uri = "https://nmcheck.gnome.org/";
        };
      };
    };
    useDHCP = false;
    dhcpcd.enable = false;
  };

  services.resolved = {
    enable = true;
    dnssec = "allow-downgrade";
    fallbackDns = [
      "1.1.1.1"
      "1.0.0.1"
    ];
    dnsovertls = "true";
  };

  users.users.${username}.extraGroups = [ "networkmanager" ];
}
