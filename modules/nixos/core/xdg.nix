{ pkgs, ... }:
{
  xdg = {
    portal.enable = true;
    portal.config = {
      common = {
        default = [ "gtk" ];
      };
    };
    portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };
}
