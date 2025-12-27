{ ... }:
{
  services.flatpak = {
    enable = true;
    packages = [
      # Proton Apps
      "com.protonvpn.www"
      "me.proton.Pass"

      "io.gitlab.adhami3310.Converter"
      "com.github.huluti.Curtail"
      "com.github.finefindus.eyedropper"
      "com.spotify.Client"
    ];
  };
}
