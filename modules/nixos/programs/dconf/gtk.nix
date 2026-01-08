{ ... }:
{
  programs.dconf.profiles.user.databases = [
    {
      lockAll = false;
      settings = {
        "org/gtk/settings/file-chooser" = {
          show-hidden = true;
        };
        "org/gtk/gtk4/settings/file-chooser" = {
          show-hidden = true;
        };
      };
    }
  ];
}
