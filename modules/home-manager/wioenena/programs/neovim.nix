{ pkgs, ... }:
{
  programs.neovim = {
    defaultEditor = true;
    enable = true;
    package = pkgs.neovim-unwrapped;
  };

  home.packages = [ pkgs.luarocks ];
}
