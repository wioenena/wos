{ ... }:
let
  nameservers = import ./nameservers.nix;
in
{
  services.resolved = {
    enable = true;
    dnssec = "true";
    dnsovertls = "true";
    domains = [ "~." ];
    fallbackDns = nameservers;
  };
}
