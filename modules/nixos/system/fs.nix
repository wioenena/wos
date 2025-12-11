{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dosfstools
    exfatprogs
    e2fsprogs
    btrfs-progs
    ntfs3g
  ];
}
