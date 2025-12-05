{ pkgs, ... }:
{
  hardware.firmware = [ pkgs.linux-firmware ];
}
