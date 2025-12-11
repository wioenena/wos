{ pkgs, ... }:
{
  hardware = {
    amdgpu.initrd.enable = true;
    amdgpu.opencl.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  environment.systemPackages = with pkgs; [
    lact
    mesa-demos
    vulkan-tools
    pciutils
    clinfo
  ];
  systemd.packages = [ pkgs.lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];
  environment.variables = {
    vblank_mode = 0; # DISABLE V_SYNC GLOBALLY
  };
}
