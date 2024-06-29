{ pkgs, ... }:
{
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    jetbrains-mono
    font-awesome_5
    (google-fonts.override {
      fonts = [
        "Inter"
        "Poppins"
        "Roboto"
        "Open Sans"
      ];
    })

    fira-code
    fira-code-symbols
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "JetBrainsMono"
        "CascadiaCode"
      ];
    })
  ];
}
