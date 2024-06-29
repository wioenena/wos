{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # GTK
    gtk4
    gtk3
    gtk2

    # Filesystem utilites
    btrfs-progs
    dosfstools
    exfatprogs
    e2fsprogs
    ntfs3g
  ];
}
