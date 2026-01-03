{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    generateCompletions = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      man = "batman";
    };
  };

  environment.systemPackages = with pkgs.fishPlugins; [
    done
    spark
    autopair
  ];
}
