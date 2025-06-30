{ wosCfg, pkgs, ... }:
{
  boot = {
    plymouth.enable = true;
    initrd = {
      systemd.enable = true;
      supportedFilesystems = {
        btrfs = true;
      };
    };

    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "quiet"
      "loglevel=3"
      "udev.log_level=3"
      "boot.shell_on_fail"
      "splash"
    ] ++ wosCfg.boot.kernelParams;

    loader = {
      grub = {
        enable = true;
        useOSProber = true;
        efiSupport = true;
        device = "nodev";
        extraGrubInstallArgs = [ "bootloader-id=NixOS" ];
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
  };
}
