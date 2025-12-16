{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.ffmpeg-full.override {
      withMetal = false;
      withUnfree = true;
      withDebug = false;
    })
  ];
}
