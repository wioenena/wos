{ ... }:
{
  services.flatpak = {
    enable = true;
    packages = [
      "io.gitlab.adhami3310.Converter"
    ];
  };
}
