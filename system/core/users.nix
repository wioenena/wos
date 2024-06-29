{ pkgs, lib, ... }:
{
  users.users.wioenena = {
    isNormalUser = true;
    initialPassword = "nixos";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.fish;
  };
}
