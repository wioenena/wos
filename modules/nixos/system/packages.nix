{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libnotify
    gcc
    clang
    protonvpn-gui
    wireguard-tools
  ];
}
