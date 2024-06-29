{ }:
let
  naturalScroll = "true";
  terminal = "kitty";
  gapsIn = "2";
  gapsOut = "10";
  borderSize = "1";
  activeBorderColor = "rgba(33CCFFEE) rgba(00FF99EE) 45deg";
  inactiveBorderColor = "rgba(595959AA)";
  layout = "dwindle";
  rounding = "0";
  blurSize = "3";
  cursorSize = "24";
  cursorTheme = "material_dark_cursors";
in
''
  monitor =,1920x1080@144,auto,1.25

  # Auto-start
  exec-once = hyprctl setcursor ${cursorTheme} ${cursorSize}
  exec-once = swww init
  exec-once = waybar

  # Env
  ## Toolkit Backend Variables
  env = GDK_BACKEND,wayland,x11,*
  env = SDL_VIDEODRIVER,wayland
  env = CLUTTER_BACKEND,wayland

  ## XDG
  env = XDG_CURRENT_DESKTOP,Hyprland
  env = XDG_SESSION_TYPE,wayland
  env = XDG_SESSION_DESKTOP,Hyprland

  ## QT
  env = QT_AUTO_SCREEN_SCALE_FACTOR,1
  env = QT_QPA_PLATFORM,wayland;xcb
  env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
  env = QT_QPA_PLATFORMTHEME,qt5ct

  ## Theming
  env = XCURSOR_SIZE,${cursorSize}
  env = HYPRCURSOR_SIZE,${cursorSize}
  env = XCURSOR_THEME,${cursorTheme}

  general {
    gaps_in = ${gapsIn}
    gaps_out = ${gapsOut}
    gaps_workspaces = 0

    border_size = ${borderSize}
    col.active_border = ${activeBorderColor}
    col.inactive_border = ${inactiveBorderColor}

    layout = ${layout} 

    allow_tearing = false
  }

  decoration {
    rounding = ${rounding}

    blur {
      enabled = true
      size = ${blurSize}
      passes = 2
      special = false 
      new_optimizations = true
      # xray = true
      ignore_opacity = true 
      vibrancy = 0.1696
      popups = true 
    }

    drop_shadow = false

    dim_inactive = false
    dim_strength = 0.2
    dim_special = 0.5
  }

  animations {
    enabled = true
    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
  }

  dwindle {
    pseudotile = true 
    # preserve_split = true
    no_gaps_when_only = 2
  }

  master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    new_status = master 
  }

  misc {
    disable_hyprland_logo = true
    disable_autoreload = false
    enable_swallow = true 
    swallow_regex = ^(kitty)$
  }

  input {
    kb_layout = tr
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 1

    touchpad {
      disable_while_typing = true
      natural_scroll = ${naturalScroll}
    }

    numlock_by_default = true 

    sensitivity = 0
  }

  gestures {
    workspace_swipe = true 
  }

  xwayland {
    force_zero_scaling = true;
  }

  # See https://wiki.hyprland.org/Configuring/Keywords/ for more
  $mainMod = SUPER

  # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
  bind = $mainMod, Q, exec, ${terminal}
  bind = $mainMod, C, killactive, 
  bind = $mainMod, M, exit, 
  bind = $mainMod, V, togglefloating, 
  bind = $mainMod, F, fullscreen
  bind = $mainMod, P, pseudo, # dwindle
  # bind = $mainMod, J, togglesplit, # dwindle
  bind = , Print, exec, grim - | wl-copy 
  bind = $mainMod, Print, exec, grim -g "$(slurp -d)" - | wl-copy 

  # Move focus with mainMod + key. Vim like.
  bind = $mainMod, h, movefocus, l
  bind = $mainMod, l, movefocus, r
  bind = $mainMod, k, movefocus, u
  bind = $mainMod, j, movefocus, d

  # Switch workspaces with mainMod + [0-9]
  bind = $mainMod, 1, workspace, 1
  bind = $mainMod, 2, workspace, 2
  bind = $mainMod, 3, workspace, 3
  bind = $mainMod, 4, workspace, 4
  bind = $mainMod, 5, workspace, 5
  bind = $mainMod, 6, workspace, 6
  bind = $mainMod, 7, workspace, 7
  bind = $mainMod, 8, workspace, 8
  bind = $mainMod, 9, workspace, 9
  bind = $mainMod, 0, workspace, 10

  # Move active window to a workspace with mainMod + SHIFT + [0-9]
  bind = $mainMod SHIFT, 1, movetoworkspace, 1
  bind = $mainMod SHIFT, 2, movetoworkspace, 2
  bind = $mainMod SHIFT, 3, movetoworkspace, 3
  bind = $mainMod SHIFT, 4, movetoworkspace, 4
  bind = $mainMod SHIFT, 5, movetoworkspace, 5
  bind = $mainMod SHIFT, 6, movetoworkspace, 6
  bind = $mainMod SHIFT, 7, movetoworkspace, 7
  bind = $mainMod SHIFT, 8, movetoworkspace, 8
  bind = $mainMod SHIFT, 9, movetoworkspace, 9
  bind = $mainMod SHIFT, 0, movetoworkspace, 10

  # Example special workspace (scratchpad)
  bind = $mainMod, S, togglespecialworkspace, magic
  bind = $mainMod SHIFT, S, movetoworkspace, special:magic

  # Scroll through existing workspaces with mainMod + scroll
  bind = $mainMod, mouse_down, workspace, e+1
  bind = $mainMod, mouse_up, workspace, e-1

  # Move/resize windows with mainMod + LMB/RMB and dragging
  bindm = $mainMod, mouse:272, movewindow
  bindm = $mainMod, mouse:273, resizewindow

  # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
  # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

  # Example windowrule v1
  # windowrule = float, ^(kitty)$
  # Example windowrule v2
  # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
  # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
  windowrulev2 = suppressevent maximize, class:.* # You'll probably like this.
  windowrulev2 = noblur,title:^()$,class:^()$
  layerrule = blur,waybar
''
