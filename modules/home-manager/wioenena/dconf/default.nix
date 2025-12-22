{ ... }:
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
        ];
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
      };
      "org/gtk/gtk4/settings/file-chooser" = {
        show-hidden = true;
      };
    };
  };
}
