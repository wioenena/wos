{ inputs, pkgs, ... }:
{
  specialisation.Niri = {
    inheritParentConfig = true;
    configuration = {
      programs.niri = {
        enable = true;
        useNautilus = true;
      };
      programs.waybar.enable = true;
      programs.kdeconnect.enable = true;

      environment.systemPackages = with pkgs; [
        swaylock
        xwayland-satellite
        inputs.awww.packages.${system}.awww
      ];
    };
  };
}
