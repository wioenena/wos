{ pkgs, lib, ... }:
{
  imports = [
    ./apps.nix
    ./extensions.nix
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
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
          "apps-menu@gnome-shell-extensions.gcampax.github.com"
          "places-menu@gnome-shell-extensions.gcampax.github.com"
          "drive-menu@gnome-shell-extensions.gcampax.github.com"
          "system-monitor@gnome-shell-extensions.gcampax.github.com"
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
      "org/gnome/desktop/peripherals/mouse" = {
        natural-scroll = false;
      };
      "org/gnome/desktop/input-sources" = {
        sources = [
          (lib.hm.gvariant.mkTuple [
            "xkb"
            "us"
          ])
          (lib.hm.gvariant.mkTuple [
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
      "org/gnome/desktop/interface" = {
        font-antialiasing = "rgba";
      };
    };
  };
}
