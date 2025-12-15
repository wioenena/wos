final: prev: {
  gnomeExtensions = prev.gnomeExtensions // {
    lockkeys-vaina = final.callPackage ./lockkeys-vaina.nix { };
    gtk4-desktop-icons-ng-ding = final.callPackage ./gtk4-desktop-icons-ng-ding.nix { inherit final prev; };
  };
}
