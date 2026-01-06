{ lib, ... }:
{
  specialisation.hyprland = {
    inheritParentConfig = true;
    configuration = {
      system.nixos.tags = [ "hyprland" ];
      services.desktopManager.gnome.enable = false;
      services.gnome = {
        core-developer-tools.enable = false;
      };
    };
  };
}
