{ inputs, ... }:
{
  services.displayManager.gdm = {
    enable = true;
  };
}
