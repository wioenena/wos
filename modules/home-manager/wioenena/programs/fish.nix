{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    generateCompletions = true;
    interactiveShellInit = ''set fish_greeting'';
    plugins = [
      {
        name = "fifc";
        src = pkgs.fishPlugins.fifc.src;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
      {
        name = "spark";
        src = pkgs.fishPlugins.spark.src;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "pure";
        src = pkgs.fishPlugins.pure.src;
      }
    ];
  };
}
