{ ... }:
{
  services.flatpak = {
    enable = true;
    packages = [
      "com.spotify.Client"
      "no.mifi.losslesscut"
      "io.github.seadve.Mousai"
      "com.getpostman.Postman"
      "me.iepure.devtoolbox"
      "com.github.finefindus.eyedropper"
      "org.gimp.GIMP"
      "com.github.PintaProject.Pinta"
      "org.shotcut.Shotcut"
      "com.discordapp.Discord"
      "com.github.huluti.Curtail"
      "fr.handbrake.ghb"
      "io.github.seadve.Kooha"
      "io.gitlab.adhami3310.Converter"
      "md.obsidian.Obsidian"
      "org.mozilla.Thunderbird"
      "org.videolan.VLC"
      "org.upscayl.Upscayl"
    ];
  };
}
