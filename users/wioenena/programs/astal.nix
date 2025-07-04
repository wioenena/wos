{
  inputs,
  pkgs,
  ...
}:
{

  imports = [ inputs.ags.homeManagerModules.default ];

  home.packages = [ inputs.astal.packages.${pkgs.stdenv.hostPlatform.system}.default ];

  programs.ags = {
    enable = true;
    configDir = ./ags;

    extraPackages = with pkgs; [
      inputs.astal.packages.${pkgs.system}.battery
      inputs.astal.packages.${pkgs.system}.hyprland
      inputs.astal.packages.${pkgs.system}.mpris
      inputs.astal.packages.${pkgs.system}.network
      inputs.astal.packages.${pkgs.system}.wireplumber
      inputs.astal.packages.${pkgs.system}.tray

    ];
  };
}
