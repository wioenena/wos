{ pkgs, ... }:
{
  programs.kdeconnect = {
    enable = true;
    package = pkgs.kdeconnect-kde.overrideAtrrs (oldAttrs: {
      postInstall = (oldAttrs.postInstall or "") + ''
        rm $out/etc/xdg/autostart/org.kde.kdeconnect.daemon.desktop
      '';
    });
  };
}
