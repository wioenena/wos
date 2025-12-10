{ pkgs, ... }:
{
  services.desktopManager.gnome.enable = true;
  services.gnome = {
    core-developer-tools.enable = true;
    sushi.enable = true;
  };

  environment.systemPackages = with pkgs; [
    refine
    gnome-boxes
    gnome-builder
    d-spy
    dconf-editor
  ];

  environment.gnome.excludePackages = with pkgs; [
    geary
    gnome-contacts
    gnome-maps
    gnome-music
    simple-scan
    snapshot
    decibels
    papers
    yelp
    gnome-logs
    gnome-tour
    seahorse
    epiphany
  ];
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gnome ];
}
