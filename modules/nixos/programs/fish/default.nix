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
      ls = "eza --all --long --icons always";
      cd = "z";
    };
  };

  environment.systemPackages = with pkgs.fishPlugins; [
    done
    spark
    autopair
  ];
}
