{ final, prev }: prev.gnomeExtensions.gtk4-desktop-icons-ng-ding.overrideAttrs (oldAttrs: {
  buildInputs = (oldAttrs.buildInputs or []) ++ [
    final.gtk4
    final.libadwaita
    final.glib
    final.gobject-introspection
  ];
  nativeBuildInputs = (oldAttrs.nativeBuildInputs or [])++[
    final.wrapGAppsHook4
    final.gobject-introspection
  ];

  preFixup = ''
    gappsWrapperArgs+=(
        --prefix GI_TYPELIB_PATH : "${final.gtk4}/lib/girepository-1.0"
        --prefix GI_TYPELIB_PATH : "${final.libadwaita}/lib/girepository-1.0"
        --prefix XDG_DATA_DIRS : "${final.gtk4}/share/gsettings-schemas/${final.gtk4.name}"
    )
  '';
})
