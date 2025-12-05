{
  inputs,
  username,
  pkgs,
  ...
}:
{
  users.users.${username} = {
    isNormalUser = true;
    initialPassword = "nixos";
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };
}
