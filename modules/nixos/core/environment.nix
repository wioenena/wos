{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # GTK
    gtk4
    gtk3
    gtk2

    # Filesystem utilities
    dosfstools
    exfatprogs
    e2fsprogs
    btrfs-progs
    ntfs3g
  ];

  environment.variables = {
    vblank_mode = 0; # Disable V-Sync in system
  };
}
