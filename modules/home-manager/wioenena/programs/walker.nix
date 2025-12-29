{ lib, ... }:
{
  programs.walker = {
    enable = true;
    runAsService = true;
  };
}
