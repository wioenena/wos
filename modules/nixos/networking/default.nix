{ ... }:
let
  nameservers = import ./nameservers.nix;
in
{
  imports = [
    ./firewall.nix
    ./ipv6.nix
    ./networkmanager.nix
    ./resolved.nix
    ./wireguard.nix
  ];

  networking = {
    inherit nameservers;

    hostName = "nixos";
    hosts = {
      "127.0.0.1" = [ "localhost" ];
    };

    useDHCP = false;
    dhcpcd.enable = false;
  };
}
