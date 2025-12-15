{
  lib,
  fetchzip,
  stdenv,
  glib,
}:
let
  uuid = "lockkeys@vaina.lt";
in
stdenv.mkDerivation rec {
  pname = "gnome-shell-extensions-lockkeys-vaina";
  version = "67";
  src = fetchzip {
    url = "https://extensions.gnome.org/extension-data/lockkeysvaina.lt.v${version}.shell-extension.zip";
    sha256 = "sha256-4MIlZmaMnBoQ7GPtDa7NCjFRO1PSkKLBZL1hDMbCq/Q=";
    stripRoot = false;
  };

  nativeBuildInputs = [ glib ];

  buildPhase = ''
    runHook preBuild
    glib-compile-schemas --strict schemas
    runHook postBuild
  '';
  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/gnome-shell/extensions/${uuid}
    cp -r {icons,locale,schemas,extension.js,metadata.json,prefs.js,stylesheet.css} $out/share/gnome-shell/extensions/${uuid}/
    runHook postInstall
  '';

  meta = {
    description = "Numlock & Capslock status on the panel.";
    homepage = "https://extensions.gnome.org/extension/36/lock-keys/";
    platforms = lib.platforms.linux;
  };

  passthru = {
    extensionPortalSlug = pname;
    extensionUuid = uuid;
  };
}
