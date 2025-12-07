{ ... }:
{
  virtualisation.libvirtd.enable = true;
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
    autoPrune.enable = true;
    autoPrune.dates = "weekly";
  };
  users.users.wioenena.extraGroups = ["docker"];
}
