{pkgs, ... }:
{
  programs.neovim = {
    defaultEditor = true;
    enable = true;
    package = pkgs.neovim-unwrapped;
    extraLuaConfig = ''
      vim.o.backup = false
      vim.o.writebackup = false
      vim.o.swapfile = false
      vim.o.ignorecase = true
      vim.o.smartcase = true
      vim.o.wrap = true
      vim.o.numberwidth = 2
      vim.o.tabstop = 2
      vim.o.shiftwidth = 2
      vim.o.smarttab = true
      vim.o.autoindent = true
      vim.o.smartindent = true
      vim.o.foldenable = false
      vim.o.encoding = "utf-8"
      vim.o.fileencoding = "utf-8"
      vim.o.background = "dark"

      vim.wo.relativenumber = true


      require("config.lazy")
      require("config.lsp")
    '';
  };
}
