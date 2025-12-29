{ pkgs, ... }:
{
  services.desktopManager.gnome.enable = true;
  services.gnome = {
    core-developer-tools.enable = true;
    gnome-user-share.enable = false;
    rygel.enable = false;
  };

  # Extensions
  environment.systemPackages = with pkgs.gnomeExtensions; [
    dash-to-dock
  ];

  # Excluded packages
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
  ];

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };
}
