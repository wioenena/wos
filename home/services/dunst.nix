{ ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = "(0, 300)";
        height = "(0, 300)";
        notification_limit = 4;
        origin = "top-center";
        padding = 4;
        frame_width = 0;
        gap_size = 3;
        layer = "overlay";
        font = "Roboto 10";
        corder_radius = 24;
        background = "#1C1C1C";
        foreground = "#A855F7";
        highlight = "#A855F7";
        timeout = 7;
        alignment = "center";
        icon_corner_radius = 4;
        max_icon_size = 150;
        format = "%a\n%s\n%b\n%p%n";
        corner_radius = 8;
      };
      urgency_critical = {
        background = "#F43F5E";
        foreground = "#FF0000";
        timeout = 0;
      };
    };
  };
}
