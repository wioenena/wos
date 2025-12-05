{ inputs, pkgs, ... }:
{
  hardware = {
    cpu.amd.updateMicrocode = true;
  };
}
