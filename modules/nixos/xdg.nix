{ pkgs, ... }:
{
  xdg = {
    portal = {
      enable = true;
      config = {
        common = {
          default = "gnome";
        };
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };
  };
}
