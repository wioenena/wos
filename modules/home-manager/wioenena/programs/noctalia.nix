{ pkgs, ... }:
{
  programs.noctalia-shell = {
    enable = true;
    settings = {
      settingsVersion = 26;
      general = {
        enableShadows = false;
        language = "en";
      };
      dock.enabled = false;
      location = {
        name = "Adana";
        analogClockInCalendar = true;
      };
      ui = {
        fontDefault = "Inter";
        fontFixed = "JetBrains Mono";
        tooltipsEnabled = false;
      };
      colorSchemes = {
        predefinedScheme = "Catppuccin";
      };
      bar = {
        backgroundOpacity = 0.8;
        density = "comfortable";
        floating = true;
        position = "top";
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            { id = "plugin:launcher-button"; }
            {
              id = "ActiveWindow";
              hideMode = "hidden";
              showIcon = true;
            }
            {
              id = "MediaMini";
              hideMode = "hidden";
              hideWhenIdle = false;
              showAlbumArt = false;
              showArtistFirst = true;
              showProgressRing = true;
              showVisualizer = false;
            }
            {
              id = "NotificationHistory";
            }
          ];
          center = [
            {
              id = "Workspace";
              labelMode = "index";
            }
            {
              id = "AudioVisualizer";
              hideWhenIdle = true;
            }
          ];
          right = [
            {
              id = "SystemMonitor";
              diskPath = "/";
              showDiskUsage = true;
              showMemoryAsPercent = false;
              showNetworkStats = true;
            }
            {
              id = "KeyboardLayout";
            }
            {
              id = "Clock";
              formatHorizontal = "HH:mm ddd, MMM dd";
              formatVertical = "HH mm - dd MM";
            }
            {
              id = "SessionMenu";
              colorName = "primary";
            }
          ];
        };
      };
      sessionMenu = {
        enableCountdown = false;
        showHeader = false;
      };
    };
  };
}
