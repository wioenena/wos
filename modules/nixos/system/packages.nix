{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    coreutils
    gnutar
    findutils
    diffutils
    gnugrep
    gnused
    gawk
    util-linux
    procps
    binutils
    file
    dateutils
    rsync
    eza

    libnotify
  ];
}
