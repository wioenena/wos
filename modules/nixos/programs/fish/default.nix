{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    generateCompletions = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
  };

  environment.systemPackages = with pkgs.fishPlugins; [
    done
    spark
    autopair
  ];
}
