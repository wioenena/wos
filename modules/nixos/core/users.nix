{
  inputs,
  cfg,
  pkgs,
  ...
}:
{
  users.users.${cfg.user.username} = {
    isNormalUser = true;
    initialPassword = "nixos";
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
    description = "Barış Köprülü";
    createHome = true;
  };
}
