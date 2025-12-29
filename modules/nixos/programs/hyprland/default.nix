{ pkgs, ... }:
let
  portalScript = pkgs.writeShellScriptBin "start-hyprland-xdg-portal" ''
    ${pkgs.procps}/bin/pkill -e xdg-desktop-portal-hyprland || true
    ${pkgs.procps}/bin/pkill xdg-desktop-portal || true

    ${pkgs.xdg-desktop-portal-hyprland}/libexec/xdg-desktop-portal-hyprland &
    ${pkgs.coreutils-full}/bin/sleep 2
    ${pkgs.xdg-desktop-portal}/libexec/xdg-desktop-portal &
  '';
in
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  environment.systemPackages = [ portalScript ];
}
