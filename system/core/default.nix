{ ... }:
{
  imports = [
    ./boot.nix
    ./network.nix
    ./audio.nix
    ./locale.nix
    ./users.nix
    ./pkgs.nix
    ./environment.nix
  ];

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
