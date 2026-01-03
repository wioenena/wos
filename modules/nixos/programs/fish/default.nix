{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    generateCompletions = true;
    interactiveShellInit = ''
      echo "Welcome $(whoami)!"
      set fish_greeting
      ${pkgs.fastfetch}/bin/fastfetch
    '';
    shellAliases = {
      man = "batman";
      ls = "eza --all --long --icons always --group-directories-first";
      cd = "z";
    };
  };

  environment.systemPackages = with pkgs.fishPlugins; [
    done
    spark
    autopair
  ];
}
