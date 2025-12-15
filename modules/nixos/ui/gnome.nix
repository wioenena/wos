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
    gjs

    gnome-boxes
    gnome-builder
    gnome-tweaks
    d-spy
    dconf-editor
    sysprof
    gnome-console

    gnome-shell-extensions
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
    gnomeExtensions.caffeine
    gnomeExtensions.appindicator
    gnomeExtensions.gsconnect
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.vitals
    gnomeExtensions.just-perfection
    gnomeExtensions.lockkeys-vaina
    gnomeExtensions.show-desktop-applet
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
    geary
    devhelp
  ];
}
