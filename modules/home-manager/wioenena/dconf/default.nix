{ ... }:
{
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
        ];
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
      };
      "org/gtk/gtk4/settings/file-chooser" = {
        show-hidden = true;
      };
      "org/gnome/Console" = {
        audible-bell = false;
      };
      "org/gnome/nautilus/preferences" = {
        show-create-link = true;
        show-delete-permanently = true;
      };
      "org/gnome/shell/extensions/blur-my-shell/applications" = {
        blur = true;
        dynamic-opacity = false;
        whitelist = [ "org.gnome.Console" ];
      };
      "org/gnome/shell/extensions/clipboard-indicator" = {
        notify-on-copy = true;
        clear-on-boot = true;
      };
      "org/gnome/shell/extensions/dash-to-dock" = {
        dash-max-icon-size = 40;
        custom-theme-shrink = true;
      };
      "org/gnome/shell/extensions/gsconnect" = {
        enabled = false;
      };
      "org/gnome/shell/extensions/lockkeys" = {
        capslock-notification = "compact";
        capslock-indicator = "when-active";
        numlock-notification = "compact";
        numlock-indicator = "when-active";
      };
      "org/gnome/shell/extensions/vitals" = {
        icon-style = 1;
      };
    };
  };
}
