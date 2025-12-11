{inputs,pkgs,...}: {
  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        density = "compact";
        position = "right";
        showCapsule = false;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              id = "Wifi";
            }
          ];
          center = [
            {
              id = "Workspace";
              hideUnoccupied = true;
              labelMode = "none";
            }
          ];
          right = {
            id = "Clock";
            formatHorizontal = "HH:mm";
            formatVertical = "HH mm";
            useMonospaceFont = true;
            usePrimaryColor = true;
          };
        };
        colorSchemes.predefinedScheme = "Monochrome";
      };
    };
  };
}
