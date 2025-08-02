{ pkgs }:
pkgs.stdenv.mkDerivation {
  name = "7zip";
  version = "25.00";
  src = pkgs.fetchurl {
    url = "https://github.com/ip7z/7zip/releases/download/25.00/7z2500-linux-x64.tar.xz";
    sha256 = "sha256-FekUtUUvHaeHnG4Sho04n95REcr6uHs0hXouOhIBhAk=";
  };

  nativeBuildInputs = [
    pkgs.autoPatchelfHook
    pkgs.glibc
    pkgs.stdenv.cc.cc
  ];

  buildPhase = ''
    ${pkgs.gnutar}/bin/tar -xvf $src
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp  7zz $out/bin
    cp 7zzs $out/bin
  '';
}
