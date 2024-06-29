{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;

    extraPackages = with pkgs; [
      rocmPackages.clr.icd
      amdvlk
    ];

    extraPackages32 = with pkgs; [
      pkgsi686Linux.rocmPackages.clr.icd
      driversi868Linux.amdvlk
    ];
  };
}
