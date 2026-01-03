{ pkgs, lib, ... }:
{
  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
        lockAll = false;
        settings = {
          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
            accent-color = "teal";
            font-name = "Inter Medium 11";
            document-font-name = "Inter Medium 12";
            monospace-font-name = "JetBrains Mono Medium 11";
            font-antialiasing = "rgba";
            cursor-theme = "macOS";
            icon-theme = "Yaru-dark";
            gtk-theme = "Yaru-dark";
          };
          "org/gnome/desktop/sound" = {
            theme-name = "Yaru";
          };
          "org/gnome/shell" = {
            favorite-apps = [
              "org.gnome.Settings.desktop"
              "org.gnome.Nautilus.desktop"
              "org.gnome.Software.desktop"
              "zen-beta.desktop"
              "org.gnome.Console.desktop"
              "dev.zed.Zed.desktop"
              "code.desktop"
              "org.gnome.Extensions.desktop"
            ];

            enabled-extensions = with pkgs.gnomeExtensions; [
              dash-to-dock.extensionUuid
              gsconnect.extensionUuid
              caffeine.extensionUuid
              clipboard-indicator.extensionUuid
              kimpanel.extensionUuid
              lockkeys-vaina.extensionUuid
              vitals.extensionUuid
              "apps-menu@gnome-shell-extensions.gcampax.github.com"
              "places-menu@gnome-shell-extensions.gcampax.github.com"
              "drive-menu@gnome-shell-extensions.gcampax.github.com"
              "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
            ];
          };
          "org/gnome/desktop/wm/preferences" = {
            button-layout = "appmenu:minimize,maximize,close";
          };
          "org/gtk/gtk4/settings/file-chooser" = {
            show-hidden = true;
          };
          "org/gnome/settings-daemon/plugins/power" = {
            power-button-action = "interactive";
          };
          "org/gnome/shell/app-switcher" = {
            current-workspace-only = true;
          };
          "org/gnome/desktop/input-sources" = {
            xkb-options = [ "ctrl:nocaps" ];
            sources = [
              (lib.gvariant.mkTuple [
                "xkb"
                "us"
              ])
              (lib.gvariant.mkTuple [
                "xkb"
                "tr"
              ])
            ];
          };
          "org/gnome/system/location" = {
            enabled = false;
          };
          "org/gnome/GWeather4" = {
            temperature-unit = "centigrade";
          };

          # Application specific
          "org/gnome/Console" = {
            audible-bell = false;
          };
          "org/gnome/nautilus/prefences" = {
            show-create-link = true;
            show-delete-permanenrtly = true;
          };

          # Extensions
          "org/gnome/shell/extensions/workspace-indicator" = {
            embed-previews = false;
          };
          "org/gnome/shell/extensions/clipboard-indicator" = {
            notify-on-copy = true;
            clear-on-boot = true;
          };
          "org/gnome/shell/extensions/dash-to-dock" = {
            dash-max-icon-size = lib.gvariant.mkInt32 40;
            custom-theme-shrink = true;
            click-action = "minimize";
            show-apps-at-top = true;
          };
          "org/gnome/shell/extensions/gsconnect" = {
            enabled = false;
          };
          "org/gnome/shell/extensions/lockkeys" = {
            capslock-notification = "osd";
            capslock-indicator = "when-active";
            numlock-notification = "osd";
            numlock-indicator = "when-active";
          };
        };
      }
    ];
  };
}
