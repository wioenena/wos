{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libnotify
    libsForQt5.qtwayland
    gcc
    clang
  ];
}
