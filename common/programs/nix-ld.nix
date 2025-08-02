{ pkgs-unstable, ... }:
{
  programs.nix-ld = {
    enable = true;
    libraries = [
      pkgs-unstable.zed-editor
    ];
  };
}
