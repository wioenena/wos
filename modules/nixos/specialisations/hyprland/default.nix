{ ... }:
{
  specialisation.Hyprland = {
    inheritParentConfig = true;
    configuration = {
      system.nixos.tags = [ "Hyprland" ];

      # Disable GNOME
      services.desktopManager.gnome.enable = false;

      programs.hyprland = {
        enable = true;
        xwayland.enable = true;
        withUWSM = true;
      };
    };
  };
}
