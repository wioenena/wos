{
  inputs,
  cfg,
  pkgs,
  ...
}:
with cfg.user; {
  users.users.${username} = {
    inherit isNormalUser initialPassword extraGroups description createHome;
    shell = pkgs.fish;
  };
}
