{ ... }:
{
  dconf.settings = {
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
      click-action = "minimize";
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
    "org/gnome/shell/extensions/vitals" = {
      icon-style = 0;
    };
  };
}
