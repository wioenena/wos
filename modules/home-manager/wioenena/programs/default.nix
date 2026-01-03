{ ... }:
{

  imports = [
    ./zen-browser.nix
    ./zed-editor.nix
    ./walker.nix
  ];

  programs = {
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
