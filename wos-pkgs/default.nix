{ pkgs }:
{
  "7zip" = import ./7zip.nix { inherit pkgs; };
  "vscode" = import ./vscode.nix { inherit pkgs; };
}
