{ ... }:
let
  colors = {
    yellow = "#facc15";
    green = "#22c55e";
    red = "#ef4444";
    black = "#020202";
    purple = "#a855f7";
    workspaceBtnNotActive = "rgba(216, 180, 254, 0.2)";
    modulePadding = "3px 6px";
  };

  borderRadius = "5px";
in
{
  programs.waybar = {
    enable = true;
    settings = with colors; [
      {
        layer = "bottom";
        position = "top";
        modules-left = [
          "clock#date"
          "clock#time"
        ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [
          "network"
          "disk#/"
          "disk#/etc/nixos"
        ];

        "clock#date" = {
          "format" = "{:%m.%d.%Y}";
          "interval" = 60;
        };
        "clock#time" = {
          "format" = "{:%H:%M (%Z)}";
          "interval" = 60;
        };
        "hyprland/workspaces" = {
          "format" = "{icon} ";
          "on-click" = "activate";
          "on-scroll-up" = "hyprctl dispatch workspace e+1";
          "on-scroll-down" = "hyprctl dispatch workspace e-1";
          format-icons = {
            "active" = "";
            "default" = "";
          };
          "sort-by-number" = true;
        };
        network = {
          interface = "wlp4s0f0u5";
          format = "{ifname}";
          format-wifi = "<span color=\"${purple}\">W: ( {signalStrength}%) IP: {ipaddr}</span> <span color=\"${red}\">E: down</span>";
          format-ethernet = "W: down E: UP";
          format-disconnected = "W: down E: down";
          max-length = 35;
        };
        "disk#/" = {
          format = "{path} -> <span color=\"${red}\">{used}</span>";
          path = "/";
        };
        "disk#/etc/nixos" = {
          format = "{path} -> <span color=\"${red}\">{used}</span>";
          path = "/etc/nixos";
        };
      }
    ];

    style = with colors; ''
      * {
        border: 0;
        border-radius: 0;
        all: unset;
        font-family: "Font Awesome 6";
        font-size: 12px;
      }

      .modules-left,
      .modules-center,
      .modules-right {
        margin-top: 5px;
        margin-bottom: 5px;
        padding: 3px 6px;
      }

      .modules-left {
        margin-left: 5px;
      }

      .modules-right {
        margin-right: 5px;
      }

      .module {
        margin: 0 5px;
        border-radius: ${borderRadius};
        background-color: ${black};
        padding: ${modulePadding};
      }

      #clock {
        margin: 0 3px;
        color: ${purple};
      }

      #workspaces button {
        margin: 0 5px;
        color: ${workspaceBtnNotActive};
        transition: color ease-in-out .5s;
      }

      #workspaces button.active {
       color: ${purple};
      }

      #disk {
        color: ${purple};
      }

    '';
  };
}
