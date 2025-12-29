{ inputs, pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  specialisation.niri = {
    inheritParentConfig = true;
    configuration = {
      system.nixos.tags = [ "niri" ];
      programs.niri = {
        enable = true;
        useNautilus = true;
      };
      programs.waybar.enable = true;
      programs.kdeconnect.enable = true;

      environment.systemPackages = with pkgs; [
        swaylock
        xwayland-satellite
        alacritty
        inputs.awww.packages.${system}.awww
        inputs.walker.packages.${system}.walker
      ];
    };
  };
}
