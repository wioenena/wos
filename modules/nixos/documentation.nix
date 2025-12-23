{ ... }:
{
  documentation = {
    enable = true;
    man.enable = true;
    man.mandoc.enable = true;
    man.man-db.enable = false;
    doc.enable = true;
    dev.enable = true;
    info.enable = true;
    nixos.enable = true;
    nixos.includeAllModules = false;
  };
}
