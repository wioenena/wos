{ ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession = {
      enable = true;
      args = [
        "-W 1920"
        "-H 1080"
        "-r 144"
        "--force-grab-cursor"
        "--adaptive-sync"
      ];
    };
  };
}
