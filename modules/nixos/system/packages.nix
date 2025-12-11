{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libnotify
    gcc
    clang
  ];
}
