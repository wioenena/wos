{ pkgs, cfg, ... }:
with cfg.git; {
  programs.git = {
    inherit enable;
    settings = {
      inherit user;
    };
  };
}
