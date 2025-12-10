{ pkgs, ... }:
{
  services.desktopManager.gnome.enable = false;
  services.gnome = {
    core-developer-tools.enable = true;
    sushi.enable = true;
  };

  environment.systemPackages = with pkgs; [
    refine
  ];
}
