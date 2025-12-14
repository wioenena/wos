{ ... }:
{
  services.flatpak = {
    enable = true;
    packages = [
      "io.bassi.Amberol"
      "io.github.fizzyizzy05.binary"
      "com.github.huluti.Curtail"
      "com.github.finefindus.eyedropper"
      "io.gitlab.adhami3310.Impression"
      "dev.bragefuglseth.Keypunch"
      "net.nokyan.Resources"
      "org.gnome.Solanum"
      "io.gitlab.adhami3310.Converter"
      "io.github.seadve.Kooha"
    ];
  };
}
