{ pkgs, custom-pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = custom-pkgs.vscode;
    mutableExtensionsDir = true;
  };
}
