{ ...}:{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs-unstable; [
      zed-editor
    ];
  };
}
