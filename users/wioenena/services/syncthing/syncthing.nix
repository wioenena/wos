{ wosCfg, ... }:
{
  services.syncthing = {
    enable = true;
    passwordFile = ./password;
    guiAddress = "0.0.0.0:8384";
    settings = {
      gui = {
        user = wosCfg.user.username;
      };
      options = {
        listenAddress = "0.0.0.0:8384";
      };
    };
  };
}
