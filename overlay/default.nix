final: prev: {
  gnomeExtensions = prev.gnomeExtensions // {
    lock-keys-vaina = prev.callPackage ./gnome-extensions/lock-keys.nix { };
  };
}
