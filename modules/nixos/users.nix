{ pkgs, ... }:
{
  users.users.wioenena = {
    isNormalUser = true;
    initialPassword = "nixos";
    extraGroups = [ "wheel" ];
    description = "Barış Köprülü";
    createHome = true;
    shell = pkgs.fish;
  };
}
