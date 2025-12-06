{ inputs, pkgs, ... }:
{
  services.desktopManager.gnome = {
    enable = true;
  };

  environment.systemPackages = with pkgs.gnomeExtensions; [
    applications-menu
    dash-to-dock
    blur-my-shell
    caffeine
    appindicator
    gsconnect
    clipboard-indicator
    vitals
    places-status-indicator
    just-perfection
    desktop-icons-ng-ding
  ];
}
