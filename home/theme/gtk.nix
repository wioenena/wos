{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # GTK Themes
    orchis-theme
    nordic

    # Cursor Themes
    material-cursors
    apple-cursor
    catppuccin-cursors
  ];

  gtk = {
    enable = true;

    cursorTheme = {
      name = "material_dark_cursors";
      size = 24;
    };

    font = {
      name = "Roboto";
    };

    /*
      iconTheme = {
        package = pkgs.fluent-icon-theme;
        name = "Fluent";
      };
    */

    theme = {
      name = "Orchis-Yellow-Dark";
    };

    gtk2.extraConfig = "";
    gtk3.extraConfig = { };
    gtk4.extraConfig = { };
  };
}
