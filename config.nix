{ pkgs, lib }:
{
  host = "laptop";
  cpu = "intel";

  user = {
    username = "wioenena";
    initialPassword = "nixos";
    extraGroups = [ ];
    shell = pkgs.fish;
    home = {
      packages = [ ];
    };
  };

  allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];

  boot.kernelParams = [
    "i915.force_probe=46a8" # intel 12th Gen (Alder Lake)
  ];

  hardware = {
    graphics.extraPackages = with pkgs; [
      intel-compute-runtime # intel 12th Gen (Alder Lake)
      intel-media-driver # intel 12th Gen (Alder Lake)
      vpl-gpu-rt # intel 12th Gen (Alder Lake)
    ];
  };

  environment.systemPackages = with pkgs; [ ];

  system.stateVersion = "25.05";
  home.stateVersion = "25.05";
}
