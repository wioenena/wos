{ pkgs, ... }:
let
  terminusGrubFont = pkgs.runCommand "grub-terminus.pf2" { } ''
    ${pkgs.grub2}/bin/grub-mkfont --output $out \
      ${pkgs.terminus_font}/share/fonts/terminus/ter-x16n.pcf.gz
  '';
in
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
        font = "${terminusGrubFont}";
        gfxmodeEfi = "1920x1080";
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
    tmp.cleanOnBoot = true;
  };
}
