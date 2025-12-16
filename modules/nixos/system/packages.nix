{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    coreutils
    gnutar
    less
    findutils
    diffutils
    gnugrep
    gnused
    gawk
    util-linux
    procps
    binutils
    file
    bat
    zoxide
    dateutils
    rsync
    eza

    libnotify
  ];
}
