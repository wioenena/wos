{ pkgs, ... }:
{
  services.gnome = {
    core-developer-tools.enable = true;
  };

  environment.systemPackages = with pkgs; [ refine ];
}
