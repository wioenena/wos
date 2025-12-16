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
    mesa-demos
    vulkan-tools
    pciutils
    clinfo
  ];

  services.lact.enable = true;

  environment.variables = {
    vblank_mode = 0; # DISABLE V_SYNC GLOBALLY
  };
}
