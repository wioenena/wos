{pkgs,...}:{
  services.cliphist = {
    enable = true;
    allowImages = true;
    clipboardPacakage = pkgs.wl-clipboard;
  };
}
