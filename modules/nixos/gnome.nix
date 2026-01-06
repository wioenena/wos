{ pkgs, ... }:
let
  gnomeExtensions = with pkgs.gnomeExtensions; [
    applications-menu
    places-status-indicator
    dash-to-dock
    gsconnect
    caffeine
    clipboard-indicator
    lockkeys-vaina
    vitals
    desktop-icons-ng-ding
    add-to-desktop
    show-desktop-applet
    appindicator
  ];
in
{
  services.desktopManager.gnome.enable = true;
  services.gnome = {
    core-developer-tools.enable = true;
    gnome-user-share.enable = false;
    rygel.enable = false;
  };

  # Extensions
  environment.systemPackages = with pkgs; [ ptyxis ] ++ gnomeExtensions;

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
    gnome-console
  ];

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita";
  };
}
