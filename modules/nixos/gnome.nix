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
    pkgs.gnome-shell-extensions
    dash-to-dock
    gsconnect
    caffeine
    clipboard-indicator
    lockkeys-vaina
    vitals
  ];

  # Excluded packages
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-contacts
    gnome-music
    decibels
    epiphany
    papers
    simple-scan
    snapshot
    geary
    yelp
    devhelp
    gnome-secrets
  ];

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita";
  };
}
