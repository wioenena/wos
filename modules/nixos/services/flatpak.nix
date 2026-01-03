{ ... }:
{
  services.flatpak = {
    enable = true;
    packages = [
      "com.protonvpn.www"
      "me.proton.Pass"
      "com.spotify.Client"
      "no.mifi.losslesscut"
    ];
  };
}
