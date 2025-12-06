{ pkgs, ... }:
{
  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    settings."org/gnome/shell" = {
      enabled-extensions = with pkgs.gnomeExtensions; [
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
        lock-keys-vaina
      ];
    };
  };
}
