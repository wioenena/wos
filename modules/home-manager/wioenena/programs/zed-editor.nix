{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor-latest;
    extensions = [
      "dockerfile"
      "vue"
      "lua"
      "elixir"
      "zig"
      "prisma"
      "biome"
      "nix"
      "deno"
      "discord-presence"
      "erlang"
      "nim"
    ];
    extraPackages = with pkgs; [ nixd ];
    userSettings = {
      autosave.after_delay.milliseconds = 5000;
      tab_bar.show_nav_history_buttons = false;
      tabs = {
        show_diagnostics = "all";
        show_close_button = "hidden";
        close_position = "right";
        file_icons = true;
        git_status = true;
      };
      vim_mode = true;
      buffer_font_weight = 600.0;
      buffer_font_family = "JetBrains Mono";
      ui_font_family = ".ZedSans";
      inlay_hints.enabled = true;
      ui_font_size = 18.0;
      buffer_font_size = 16;
      theme = "Gruvbox Dark";
    };
    mutableUserSettings = true;
    mutableUserKeymaps = true;
    mutableUserTasks = true;
  };
}
