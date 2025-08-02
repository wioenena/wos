{ ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ ];
        modules-right = [ ];
        "hyprland/workspaces" = {
          format = "{name}";
        };
      };
    };

    style = ''
      * {
        font-family: "CaskaydiaCove Nerd Font", "Font Awesome 6 Free", "Font Awesome 6 Free Solid";
        font-size: 16px;
        border-radius: 0;
        min-height: 0;
        border: none;
        font-weight: bold;
      }

      #workspaces{
        background-color: rgba(24,24,37,1);
        border: none;
        box-shadow: none;
      }

      #waybar {
        background-color: rgba(24, 24, 37, 0.7);
        transition-property: background-color;
        transition-duration: 0.5s;
      }

      #window {
        border-radius: 4px;
        margin: 6px 3px;
        padding: 6px 12px;
        background-color: #1e1e2e;
        color: #181825;
      }

      #window{
        background-color: #74c7ec;
      }

      #waybar.hidden {
        opacity: 0.5;
      }

      #workspaces button {
        all: initial;
        /* Remove GTK theme values (waybar #1351) */
        min-width: 0;
        /* Fix weird spacing in materia (waybar #450) */
        box-shadow: inset 0 -3px transparent;
        /* Use box-shadow instead of border so the text isn't offset */
        padding: 6px 18px;
        margin: 6px 3px;
        border-radius: 4px;
        background-color: rgba(36, 36, 52, 1.0);
        color: #cdd6f4;
      }

      #workspaces button.active {
        color: #1e1e2e;
        background-color: #cdd6f4;
      }

      #workspaces button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        color: #1e1e2e;
        background-color: #cdd6f4;
      }
    '';
  };
}
