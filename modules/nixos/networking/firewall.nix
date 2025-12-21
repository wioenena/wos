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
    checkReversePath = false;
    allowedTCPPorts = [ ];
    allowedTCPPortRanges = [ ] ++ kdeConnectPortRanges;
    allowedUDPPortRanges = [ ] ++ kdeConnectPortRanges;
  };
}
