{ pkgs, ... }:
{
  boot = {
    initrd = {
      systemd.enable = true;
    };

    kernelPackages = pkgs.linuxPackages_zen;

    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        extraGrubInstallArgs = [ "--bootloader-id=GRUB" ];
        memtest86.enable = true;
      };
      grub2-theme = {
        enable = true;
        theme = "stylish";
        footer = true;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
  };
}
