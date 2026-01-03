{ ... }:
let
  kdeConnectPortRanges = [
    {
      from = 1714;
      to = 1764;
    }
  ];
in
{
  networking.firewall = {
    enable = true;
    backend = "nftables";
    checkReversePath = false;
    allowedTCPPorts = [ ];
    allowedTCPPortRanges = [ ] ++ kdeConnectPortRanges;
    allowedUDPPortRanges = [ ] ++ kdeConnectPortRanges;
  };
}
