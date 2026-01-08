{ ... }:
{
  imports = [
    ./gnome.nix
    ./gtk.nix
  ];
  programs.dconf.enable = true;
}
