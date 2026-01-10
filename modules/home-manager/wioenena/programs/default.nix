{ ... }:
{

  imports = [
    ./zen-browser.nix
    ./zed-editor.nix
  ];

  programs = {
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
