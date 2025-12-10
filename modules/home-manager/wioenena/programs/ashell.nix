{ ... }:
{
  programs.ashell = {
    enable = true;
    settings = {
      modules.left = [
        "Clock"
        "AppLauncher"
        "Workspaces"
      ];
      modules.center = [
        "WindowTitle"
        "MediaPlayer"
      ];
      modules.right = [
        "Tray"
        [
          "SystemInfo"
        ]
        "Settings"
      ];
      clipboard_cmd = "cliphist-rofi-img | wl-copy";
      app_launcher_cmd = "walker";
      window_title = {
        mode = "Title";
        truncate_title_after_length = 75;
      };
      media_player.max_title_length = 50;
    };
  };
}
