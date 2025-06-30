{ wosCfg, ... }:
{
  nixpkgs.config.allowUnfreePredicate = wosCfg.allowUnfreePredicate;
}
