{ ... }:
{
  imports = [
    ./firewall.nix
    ./ipv6.nix
    ./networkmanager.nix
    ./resolved.nix
    ./wireguard.nix
  ];

  networking = {
    nameservers = [
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
      "8.8.8.8#dns.google"
      "8.8.4.4#dns.google"
    ];

    hostName = "nixos";
    hosts = {
      "127.0.0.1" = [ "localhost" ];
    };

    useDHCP = false;
    dhcpcd.enable = false;
  };
}
