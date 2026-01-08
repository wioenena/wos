{ pkgs, ... }:
{
  hardware = {
    amdgpu.initrd.enable = true;
    amdgpu.opencl.enable = true;

    graphics.enable = true;
    graphics.enable32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    mesa-demos
    vulkan-tools
    pciutils
    clinfo
    libva-utils
    amdgpu_top
    radeontop
  ];

  services.lact.enable = true;
}
