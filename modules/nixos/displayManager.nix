{ pkgs, ... }:
{
  services.displayManager.gdm = {
    enable = true;
    # wayland.enable = true;
    # theme = "${
    #   pkgs.sddm-astronaut.override {
    #     embeddedTheme = "japanese_aesthetic";
    #   }
    # }/share/sddm/themes/sddm-astronaut-theme";
  };
}
