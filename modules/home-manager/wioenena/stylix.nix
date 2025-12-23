{ osConfig, ... }:
{
  stylix = {
    targets = {
      fish = osConfig.stylix.targets.fish;
      bat.enable = true;
      btop.enable = true;
      cava.enable = true;
      fzf.enable = true;
      mangohud.enable = true;
      starship.enable = true;
      tmux.enable = true;
    };
  };
}
