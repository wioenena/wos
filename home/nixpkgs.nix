{ lib, ... }:
{
  nixpkgs = {
    config = {
      allowUnfreePredicate =
        pkg:
        builtins.elem (lib.getName pkg) [
          "vscode"
          "vscode-extension-ms-vscode-cpptools"
          "spotify"
          "discord"
          "rar"
        ];
    };
  };
}
