{ ... }:
{
  programs.ashell = {
    enable = true;
    settings = {
      window_title = {
        mode = "Title";
        truncate_title_after_length = 75;
      };
      media_player.max_title_length = 50;
      apperance.font_name = "JetBrains Mono";
      modules.left = [
          "Clock"
          [ "AppLauncher" ]
          [ "Workspaces" ]
      ];
      modules.center = [
        [
          "WindowTitle"
          "MediaPlayer"
        ]
      ];
      modules.right = [
        "Tray"
        [
          "Clipboard"
          "Privacy"
          "SystemInfo"
          "Settings"
        ]
      ];
      clipboard_cmd = "cliphist-rofi-img | wl-copy";
      app_launcher_cmd = "walker";
    };
  };
}
