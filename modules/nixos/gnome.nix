{ pkgs, lib, ... }:
let
  gnomeExtensions = with pkgs.gnomeExtensions; [
    applications-menu
    places-status-indicator
    dash-to-dock
    gsconnect
    caffeine
    lockkeys-vaina
    desktop-icons-ng-ding
    add-to-desktop
    show-desktop-applet
    appindicator
  ];
in
{
  services.desktopManager.gnome.enable = lib.mkDefault true;
  services.gnome = {
    gnome-user-share.enable = false;
    rygel.enable = false;
    gnome-online-accounts.enable = false;
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
