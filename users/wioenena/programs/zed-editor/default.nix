{ pkgs-unstable, ... }:
let
  theme = "One Black";
  iconTheme = "Material Icon Theme";
in
{
  programs.zed-editor = {
    enable = true;
    package = pkgs-unstable.zed-editor;
    extensions = [
      # Themes
      "tokyo-night"
      "catppuccin"
      "github-dark-default"
      "fleet-themes"
      "one-dark-pro"
      "catppuccin-blur"
      "min-theme"
      "rose-pine-theme"
      "gruber-darker"
      "one-dark-darkened"
      "one-black-theme"
      "gruber-flavors"
      "nordic-theme"

      # Icon themes
      "catppuccin-icons"
      "material-icon-theme"
      "bearded-icon-theme"
      "monospace-icon-theme"
      "jetbrains-icons"

      # Language servers
      "zig"
      "toml"
      "java"
      "dockerfile"
      "html"
      "vue"
      "scss"
      "svelte"
      "elixir"
      "lua"
      "csharp"
      "prisma"
      "deno"
      "erlang"
      "v"
      "nim"
      "angular"
      "crystal"
      "nix"

      # Others
      "git-firefly"
    ];

    userSettings = {
      ui_font_size = 18;
      buffer_font_size = 16;
      autosave = "on_focus_change";
      vim_mode = true;
      theme = {
        mode = "system";
        dark = theme;
        light = theme;
      };
      icon_theme = iconTheme;
      current_line_highlight = "gutter";
      cursor_shape = "block";
      tab_bar = {
        show = true;
        show_nav_history_buttons = false;
      };
      tabs = {
        file_icons = true;
        git_status = true;
        show_close_button = "always";
        show_diagnostics = "all";
      };
      format_on_save = "language_server";
      file_finder = {
        modal_max_width = "xlarge";
      };
      terminal = {
        dock = "bottom";
        blinking = "on";
      };
    };
  };
}
