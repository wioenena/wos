{ ... }:
{
  programs.vscode.userSettings = {
    window = {
      titleBarStyle = "custom";
      zoomLevel = 1;
    };
    editor = {
      fontFamily = "'CaskaydiaCove Nerd Font', 'Droid Sans Mono', 'monospace', monospace";
      fontSize = 20;
      fontLigatures = "'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'zero', 'onum'";
      cursorStyle = "block";
      cursorBlinking = "phase";
      cursorSmoothCaretAnimation = "on";
      tokenColorCustomizations = {
        textMateRules = [
          {
            scope = [ "source.js" ];
            settings = {
              fontStyle = "italic";
            };
          }
        ];
      };
      minimap.autohide = true;
    };

    workbench = {
      colorTheme = "Material Theme Ocean";
      iconTheme = "material-icon-theme";
      productIconTheme = "fluent-icons";
      activityBar.location = "top";

    };

    files.autoSave = "off";

    # Extensions
    codesnap = {
      bosShadow = "none";
      realLineNumbers = true;
      roundedCorners = true;
      showWindowControls = true;
      showWindowTitle = true;
      transparentBackground = true;
      shutterAction = "copy";
      target = "container";
    };

    nix = {
      enableLanguageServer = true;
      serverPath = "nixd";
    };
  };
}
