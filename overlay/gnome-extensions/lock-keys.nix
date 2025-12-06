{ pkgs, gnomeExtensions }:
gnomeExtensions.buildShellExtension {
  pname = "lock-keys";
  version = "67";
  src = pkgs.fetchurl {
    url = "https://extensions.gnome.org/extension-data/lockkeysvaina.lt.v67.shell-extension.zip";
    sha256 = "0000000000000000000000000000000000000000000000000000";
  };
  uuid = "lockkeys@vaina.lt";
}
