{ ... }:
{
  imports = [
    ./firewall.nix
    ./networkmanager.nix
    ./resolved.nix
    ./wireguard.nix
  ];

  networking = {
    nameservers = [
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
    ];

    hostName = "nixos";
    hosts = {
      "127.0.0.1" = [ "localhost" ];
    };

    useDHCP = false;
    dhcpcd.enable = false;
  };
}
