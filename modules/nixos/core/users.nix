{
  inputs,
  pkgs,
  ...
}:
{
  users.users.wioenena = {
    isNormalUser = true;
    initialPassword = "nixos";
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };
}
