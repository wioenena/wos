{ pkgs, lib, ... }:
let
  flatpakApps = [
    # --- Communication & Email ---
    "com.discordapp.Discord"
    "org.mozilla.Thunderbird"

    # --- Graphics & Design ---
    "org.gimp.GIMP"
    "com.github.PintaProject.Pinta"
    "org.upscayl.Upscayl"
    "com.github.finefindus.eyedropper"
    "com.github.huluti.Curtail"

    # --- Multimedia (Video/Audio Players & Editors) ---
    "com.spotify.Client"
    "org.videolan.VLC"
    "io.mpv.Mpv"
    "com.obsproject.Studio"
    "com.obsproject.Studio.Plugin.OBSVkCapture" # Capture Vulkan and OpenGL applications for OBS Studio
    "org.shotcut.Shotcut"
    "no.mifi.losslesscut"
    "fr.handbrake.ghb"
    "io.github.seadve.Kooha"
    "io.github.seadve.Mousai"

    # --- Audio Control & Effects ---
    "org.pulseaudio.pavucontrol"
    "com.github.wwmm.easyeffects"

    # --- Gaming & Compatibility Layers ---
    "org.winehq.Wine"
    "com.usebottles.bottles"
    "com.heroicgameslauncher.hgl"
    "org.prismlauncher.PrismLauncher"
    "com.vysp3r.ProtonPlus"
    "io.github.radiolamp.mangojuice"

    # --- Development & Technical Tools ---
    "com.getpostman.Postman"
    "me.iepure.devtoolbox"
    "net.werwolv.ImHex"

    # --- Productivity & Office ---
    "md.obsidian.Obsidian"
    "io.gitlab.adhami3310.Converter"

    # --- Security & Privacy ---
    "com.protonvpn.www"
    "me.proton.Pass"
    "com.github.tchx84.Flatseal"
  ];

  appsString = lib.strings.concatStringsSep " " flatpakApps;
  flatpakExe = lib.getExe pkgs.flatpak;
  flatpakInstallAppsScript = pkgs.writeShellScriptBin "install-flatpak-apps" ''
    echo "--------------------------------------------------"
    echo "Running Flatpak installation script..."
    echo "--------------------------------------------------"
    ${flatpakExe} remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    ${flatpakExe} install -y --noninteractive flathub ${appsString}
    ${flatpakExe} uninstall --unused
    echo "--------------------------------------------------"
    echo "Operation completed successfully!"
    echo "--------------------------------------------------"
  '';
in
{
  services.flatpak.enable = true;
  environment.systemPackages = [ flatpakInstallAppsScript ];
}
