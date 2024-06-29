{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd=Hyprland --user-menu --theme border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red";
        user = "wioenena";
      };
    };
  };
}
