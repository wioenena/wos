{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;

    profiles.${config.home.username} = {
      userSettings = {
        window = {
          titleBarStyle = "custom";
          zoomLevel = 0;
          customTitleBarVisibility = "auto";
        };

        editor = {
          fontSize = 16;
          cursorStyle = "block";
          cursorBlinking = "smooth";
          cursorSmoothCaretAnimation = "on";
          minimap.autohide = true;
          wordWrap = "on";

        };

        workbench.activityBar.location = "top";
      };

      extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "cpptools";
          publisher = "ms-vscode";
          version = "1.26.3";
          sha256 = "sha256-f+7GTLxeBVUxuICbJm5H6pjNh1jzqq4x/Mi+Oje8YrU=";
        }
      ];
    };
  };
}
