{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.bibata-cursors ];
  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  };

  # environment.etc."gtk-3.0/settings.ini".text = ''
  #   [Settings]
  #   gtk-cursor-theme-name=Bibata-Modern-Ice
  # '';
}
