{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Libs
    libnotify
    gtk3
    gtk4
    pkgs.ffmpeg-full

    # Filesystem utilities
    dosfstools
    exfatprogs
    e2fsprogs
    btrfs-progs
    ntfs3g
  ];
}
