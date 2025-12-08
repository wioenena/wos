{ pkgs, ... }:
{
  programs.neovim = {
    defaultEditor = true;
    enable = true;
    package = pkgs.neovim-unwrapped;
    plugins = with pkgs; [
      vimPlugins.lazy-nvim
    ];
  };

  xdg.configFile."nvim/init.lua".source = ./init.lua;
  xdg.configFile."nvim/lua/config".source = ./config;
  xdg.configFile."nvim/lua/plugins".source = ./plugins;

}
