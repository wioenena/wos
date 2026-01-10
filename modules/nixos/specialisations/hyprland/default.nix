{ ... }:
{
  specialisation.Hyprland = {
    inheritParentConfig = true;
    configuration = {
      system.nixos.tags = [ "Hyprland" ];

      imports = [
        ./xdg.nix
        ./programs.nix
      ];

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
