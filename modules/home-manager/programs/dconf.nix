{ pkgs, ... }:
{

  home.packages = with pkgs.gnomeExtensions; [
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
    lock-keys-vaina
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/desktop/wm/keybindings".switch-applications = [ ];
      "org/gnome/desktop/wm/keybindings".switch-windows = [ "<Alt>Tab" ];
      "org/gnome/shell" = {
        enabled-extensions = with pkgs.gnomeExtensions; [
          applications-menu.extensionUuid
          dash-to-dock.extensionUuid
          blur-my-shell.extensionUuid
          caffeine.extensionUuid
          appindicator.extensionUuid
          gsconnect.extensionUuid
          clipboard-indicator.extensionUuid
          vitals.extensionUuid
          places-status-indicator.extensionUuid
          just-perfection.extensionUuid
          lock-keys-vaina.extensionUuid
        ];
      };
    };
  };
}
