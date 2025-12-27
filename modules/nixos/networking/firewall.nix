{ ... }:
{
  networking.firewall = {
    enable = true;
    checkReversePath = false;
    allowedTCPPorts = [ ];
    allowedTCPPortRanges = [ ];
    allowedUDPPortRanges = [ ];
  };
}
