{ pkgs, ... }:
{
  services.desktopManager.gnome.enable = true;
  services.gnome = {
    sushi.enable = true;
    localsearch.enable = true;
    gnome-software.enable = true;
    gnome-settings-daemon.enable = true;
    gnome-online-accounts.enable = false;
    gnome-keyring.enable = true;
    gnome-browser-connector.enable = true;
    games.enable = false;
    core-shell.enable = true;
    core-os-services.enable = true;
    core-apps.enable = true;
    core-developer-tools.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnome-boxes
    gnome-builder
    d-spy
    dconf-editor
    sysprof
    gnome-console
    gnome-terminal
  ];

  environment.gnome.excludePackages = with pkgs; [
    decibels
    snapshot
    gnome-contacts
    simple-scan
    papers
    yelp
    gnome-logs
    gnome-music
    gnome-tour
    epiphany
  ];
}
