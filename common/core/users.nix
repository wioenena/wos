{ wosCfg, pkgs, ... }:
{
  users.users.${wosCfg.user.username} = {
    isNormalUser = true;
    initialPassword = wosCfg.user.initialPassword;
    extraGroups = [ "wheel" ] ++ wosCfg.user.extraGroups;
    shell = wosCfg.user.shell;
  };
}
