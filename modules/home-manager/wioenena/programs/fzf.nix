{ ... }:
{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    defaultOptions = [
      # "--info=inline"
      # "--border=rounded"
      # "--margin=1"
      # "--padding=1"
    ];
  };
}
