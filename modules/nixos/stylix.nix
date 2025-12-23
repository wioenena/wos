{ pkgs, ... }:
{
  stylix = {
    enable = true;
    enableReleaseChecks = true;
    autoEnable = false;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    targets = {
    };
  };
}
