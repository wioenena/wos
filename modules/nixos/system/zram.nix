{ ... }:
{
  zramSwap = {
    memoryPercent = 50;
    enable = true;
    algorithm = "zstd";
  };
}
