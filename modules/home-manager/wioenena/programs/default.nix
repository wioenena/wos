{ ... }:
{

  imports = [
    ./neovim.nix
    ./fzf.nix
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
