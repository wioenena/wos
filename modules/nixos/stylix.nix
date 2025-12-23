{ pkgs, ... }:
{
  stylix = {
    enable = true;
    enableReleaseChecks = true;
    autoEnable = false;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    fonts = {
      serif = {
        package = pkgs.inter;
        name = "Inter";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
    targets = {
      gtk.enable = true;
      gnome.enable = true;
      gnome-text-editor.enable = true;
      fish.enable = true;
    };
  };
}
