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
    applications-menu
    places-status-indicator
    removable-drive-menu
    workspace-indicator
    background-logo
    dash-to-dock
    gsconnect
    caffeine
    clipboard-indicator
    lockkeys-vaina
    vitals
    desktop-icons-ng-ding
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
