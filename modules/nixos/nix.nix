{ pkgs, ... }:
{
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    optimise.automatic = true;
    optimise.dates = [ "03:45" ];
    settings.auto-optimise-store = true;
  };

  environment.systemPackages = [ pkgs.nixd ];
}
