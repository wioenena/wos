{ wosCfg, ... }:
{
  imports = [ ./hardware-configuration.nix ];
  system.stateVersion = wosCfg.system.stateVersion;
}
