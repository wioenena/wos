{ ... }:
{
  programs.ashell = {
    enable = true;
    settings = {
      window_title = {
        mode = "Title";
        truncate_title_after_length = 75;
      };
      clock.format = "%D %r";
      media_player.max_title_length = 50;
      apperance.font_name = "JetBrains Mono";
      modules.left = [["appLauncher" "Workspaces"]];
      modules.center = [["WindowTitle"]];
      modules.right = ["SystemInfo" ["Clipboard" "Tray" "Clock" "Privacy" "Settings"]];
      clipboard_cmd = "cliphist-rofi-img | wl-copy";
    };
  };
}
