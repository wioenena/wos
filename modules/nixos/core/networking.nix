{ ... }:
let
  nameservers = [
    "1.1.1.1"
    "1.0.0.1"
    "8.8.8.8"
    "8.8.4.4"
  ];
in
{
  # IPv6
  networking.enableIPv6 = false;
  boot.kernelParams = [ "ipv6.disable=1" ];

  networking = {
    inherit nameservers;

    hostName = "nixos";
    hosts = {
      "127.0.0.1" = [ "localhost" ];
    };

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
    dnssec = "true";
    dnsovertls = "true";
    fallbackDns = nameservers;
  };

  users.users.wioenena.extraGroups = [ "networkmanager" ];
}
