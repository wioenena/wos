{
  wosCfg,
  lib,
  pkgs,
  ...
}:
{
  hardware = {
    cpu = {
      intel.updateMicrocode = (lib.mkIf (wosCfg.cpu == "intel") true);
      amd.updateMicrocode = (lib.mkIf (wosCfg.cpu == "amd") true);
    };

    graphics = {
      enable = true;
      extraPackages = wosCfg.hardware.graphics.extraPackages;
    };
  };
}
