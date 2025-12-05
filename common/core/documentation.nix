{ inputs, ... }:
{
  documentation = {
    enable = true;
    man.enable = true;
    doc.enable = true;
    dev.enable = true;
    info.enable = true;
    nixos = {
      enable = true;
      includeAllModules = true;
    };
  };
}
