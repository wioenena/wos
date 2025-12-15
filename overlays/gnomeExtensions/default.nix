final: prev: {
  gnomeExtensions = prev.gnomeExtensions // {
    lockkeys-vaina = final.callPackage ./lockkeys-vaina.nix { };
  };
}
