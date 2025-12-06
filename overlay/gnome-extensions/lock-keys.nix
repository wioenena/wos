{
  lib,
  stdenv,
  fetchzip,
  glib,
  gnome-shell,
}:
stdenv.mkDerivation {
  pname = "gnome-shell-extension-lock-keys-vaina";
  version = "67";

  src = fetchzip {
    url = "https://extensions.gnome.org/extension-data/lockkeysvaina.lt.v67.shell-extension.zip";
    sha256 = "sha256-4MIlZmaMnBoQ7GPtDa7NCjFRO1PSkKLBZL1hDMbCq/Q=";
    stripRoot = false;
  };

  nativeBuildInputs = [ glib ];

  buildPhase = ''
    runHook preBuild
    glib-compile-schemas --strict --targetdir=schemas schemas
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p "$out/share/gnome-shell/extensions/lockkeys@vaina.lt"
    cp -r {extension.js,prefs.js,stylesheet.css,schemas,locale,icons} "$out/share/gnome-shell/extensions/lockkeys@vaina.lt"
    runHook postInstall
  '';

  meta = with lib; {
    description = "Numlock & Capslock status on the panel.";
    license = licenses.gpl2;
    homepage = "https://github.com/kazysmaster/gnome-shell-extension-lockkeys";
    broken = versionOlder gnome-shell.version "45";
  };
}
