{ ... }:
{
  services.flatpak = {
    enable = true;
    packages = [
      # Proton Apps
      "com.protonvpn.www"
      "me.proton.Pass"

      "com.spotify.Client"
    ];
  };
}
