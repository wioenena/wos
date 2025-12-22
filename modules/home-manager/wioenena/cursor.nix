{pkgs, ...}: {
  home.pointerCursor = {
    enable = true;
    name = pkgs.bibata-cursors.name;
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
    dotIcons.enable = true;
  };
}
