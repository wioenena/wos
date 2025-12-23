{ pkgs,osConfig, ... }:
{
  stylix = {
    enable = osConfig.stylix.enable;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
    cursor = osConfig.stylix.cursor;
    targets = {
      gtk.enable = true;
      gnome.enable = true;
    };
  };
}
