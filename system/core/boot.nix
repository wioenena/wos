{
  host,
  local-pkgs,
  pkgs,
  lib,
  ...
}:
{
  boot = {
    bootspec.enable = true;

    initrd = {
      systemd.enable = true;
      supportedFilesystems = [ "btrfs" ];
      kernelModules = [ "amdgpu" ];
    };

    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "quiet"
      "splash"
      "udev.log_level=3"
      "radeon.si_support=0"
      "amdgpu.si_support=1"
      "amdgpu.si_support=1"
      "radeon.cik_support=0"
      "amdgpu.cik_support=1"
    ];

    loader = {
      grub = {
        enable = true;
        useOSProber = true;
        efiSupport = true;
        device = "nodev";
        theme = local-pkgs.distro-grub-themes;
        extraGrubInstallArgs = [ "bootloader-id=NixOS" ];
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      timeout = 10;
    };
  };
}
