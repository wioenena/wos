{ osConfig, ... }:
{
  stylix = {
    targets = {
      gnome = {
        enable = true;
        colors.enable = false;
        fonts.enable = true;
        image.enable = false;
        inputs.enable = false;
        polarity.enable = false;
      };
      bat.enable = true;
      btop.enable = true;
      cava.enable = true;
      fzf.enable = true;
      mangohud.enable = true;
      tmux.enable = true;
    };
  };
}
