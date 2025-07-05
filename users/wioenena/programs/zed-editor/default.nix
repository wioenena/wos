{ ... }:
{
  programs.zed-editor = {
    enable = true;
    userSettings = {
      ui_font_size = 16;
      buffer_font_size = 16;
      autosave = {
        after_delay = {
          milliseconds = 1000;
        };
      };
      vim_mode = true;
      theme = {
        mode = "system";
      };
    };
  };
}
