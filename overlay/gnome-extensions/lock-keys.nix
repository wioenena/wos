{ lib, stdenv, fetchzip, gnome-shell }:
stdenv.mkDerivation {
  pname = "gnome-shell-extension-lock-keys-vaina";
  version = "67";

  src = fetchzip {
    url = "https://extensions.gnome.org/extension-data/lockkeysvaina.lt.v67.shell-extension.zip";
    sha256 = "1wcw730c683qd3c74gdsqcp2sa20qic8v9cvc4lvgqjqf3k94w51";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p "$out/share/gnome-shell/extensions/lockkeys@vaina.lt"
    cp -r {extension.js,pref.js,stylesheet.css,schemas,locale,icons} "$out/share/gnome-shell/extensions/lockkeys@vaina.lt"
    runHook postInstall
  '';

  meta = with lib; {
    description = "Numlock & Capslock status on the panel.";
    license = licenses.gpl2;
    homepage = "https://github.com/kazysmaster/gnome-shell-extension-lockkeys";
    broken = versionOlder gnome-shell.version "45";
  };
}
