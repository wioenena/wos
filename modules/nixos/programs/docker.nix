{ inputs, ... }:
{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
    autoPrune.enable = true;
    autoPrune.dates = "weekly";
  };
}
