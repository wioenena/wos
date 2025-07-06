{ inputs, pkgs, ... }:
let
  cursorSize = "24";
  terminal = "kitty";
  touchpad = {
    device = "syna3602:00-093a:0255-touchpad";
    enable = false;
  };
in
{
  home.packages = with pkgs; [
    hyprpicker
    hyprcursor
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    settings = {
      "$mod" = "SUPER";
      monitor = [ ",1920x1080,auto,1" ];
      env = [
        "XCURSOR_SIZE,${cursorSize}"
        "HYPRCURSOR_SIZE,${cursorSize}"

        # Toolkit Backend Variables
        "GDK_BACKEND,wayland,x11,*"
        "QT_QPA_PLATFORM,wayland"
        "SDL_VIDEODRIVER,wayland"
        "CLUTTER_BACKEND,wayland"

        # XDG Specifications
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"

        # Qt Variables
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME,qt5ct"
      ];

      exec-once = [
        "waybar"
      ];

      general = {
        gaps_in = 2;
        gaps_out = 5;

        border_size = 2;
        no_border_on_floating = true;

        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        resize_on_border = false;

        allow_tearing = false;
        layout = "dwindle";

        snap = {
          enabled = true;
          border_overlap = true;
          respect_gaps = true;
        };
      };

      decoration = {
        rounding = 5;
        rounding_power = 10;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow.enabled = false;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
        enable_swallow = true;
        swallow_regex = "^(kitty)$";
      };

      xwayland = {
        force_zero_scaling = true;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };

      device = [
        {
          name = touchpad.device;
          enabled = touchpad.enable;
        }
      ];

      gestures = {
        workspace_swipe = false;
      };

      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };

      bind = [
        "$mod , Q, exec, ${terminal}"
        "$mod , C, killactive,"
        "$mod , M, exit,"
        #        "$mod , E, exec, $fileManager"
        "$mod , V, togglefloating,"
        #        "$mod , R, exec, $menu"
        "$mod , P, pseudo, # dwindle"
        # "$mod , J, togglesplit, # dwindle"
        "$mod , F, fullscreen"

        # Move focus with mainMod + arrow keys
        "$mod , l, movefocus, l"
        "$mod , h, movefocus, r"
        "$mod , k, movefocus, u"
        "$mod , j, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mod , 1, workspace, 1"
        "$mod , 2, workspace, 2"
        "$mod , 3, workspace, 3"
        "$mod , 4, workspace, 4"
        "$mod , 5, workspace, 5"
        "$mod , 6, workspace, 6"
        "$mod , 7, workspace, 7"
        "$mod , 8, workspace, 8"
        "$mod , 9, workspace, 9"
        "$mod , 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # Example special workspace (scratchpad)
        "$mod , S, togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mod , mouse_down, workspace, e+1"
        "$mod , mouse_up, workspace, e-1"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mod , mouse:272, movewindow"
        "$mod , mouse:273, resizewindow"
      ];

      bindel = [
        # Laptop multimedia keys for volume and LCD brightness
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      bindl = [
        # Requires playerctl
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      windowrule = [
        # Ignore maximize requests from apps. You'll probably like this.
        "suppressevent maximize, class:.*"

        # Fix some dragging issues with XWayland
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

        # Opacity Zed Editor
        "opacity 0.9, class:dev.zed.Zed"
      ];
    };
  };
}
