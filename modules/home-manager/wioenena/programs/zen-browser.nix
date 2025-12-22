{ pkgs, ... }:
let
  mkExtensionSettings = builtins.mapAttrs (
    _: pluginId: {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
      installation_mode = "force_installed";
    }
  );
in
{
  programs.zen-browser = {
    enable = true;
    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      ExtensionSettings = mkExtensionSettings {
        "addon@darkreader.org" = "darkreader";
        "78272b6fa58f4a1abaac99321d503a20@proton.me" = "proton-pass";
        "vpn@proton.ch" = "proton-vpn-firefox-extension";
        "uBlock0@raymondhill.net" = "ublock-origin";
      };
    };
    profiles.default = {
      containersForce = false;
      pinsForce = false;
      spacesForce = false;
      settings = {
        "zen.view.use-single-toolbar" = false;
        "browser.translations.automaticallyPopup" = false;
        "zen.tabs.essentials.max" = 16;
        "browser.translations.mostRecentTargetLanguages" = "en,tr";
        "general.autoScroll" = true;
        "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;
        "browser.uiCustomization.state" = builtins.toJSON {
          "placements" = {
            "widget-overflow-fixed-list" = [ ];
            "nav-bar" = [
              "back-button"
              "forward-button"
              "stop-reload-button"
              "customizableui-special-spring1"
              "vertical-spacer"
              "urlbar-container"
              "customizableui-special-spring2"
              "unified-extensions-button"
              "ublock0_raymondhill_net-browser-action"
              "addon_darkreader_org-browser-action"
              "vpn_proton_ch-browser-action"
              "78272b6fa58f4a1abaac99321d503a20_proton_me-browser-action"
            ];
            "toolbar-menubar" = [
              "menubar-items"
            ];
            "TabsToolbar" = [
              "tabbrowser-tabs"
            ];
            "vertical-tabs" = [ ];
            "PersonalToolbar" = [
              "import-button"
              "personal-bookmarks"
            ];
            "zen-sidebar-top-buttons" = [
              "zen-toggle-compact-mode"
            ];
            "zen-sidebar-foot-buttons" = [
              "downloads-button"
              "zen-workspaces-button"
              "zen-create-new-button"
            ];
          };
        };
      };
      search = {
        force = true;
        default = "google";
        privateDefault = "ddg";
        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "channel";
                    value = pkgs.lib.versions.majorMinor pkgs.lib.version;
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@npkgs" ];
          };
          "Nix Options" = {
            urls = [
              {
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "channel";
                    value = pkgs.lib.versions.majorMinor pkgs.lib.version;
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@nopts" ];
          };
          "MyNixOS" = {
            urls = [
              {
                template = "https://mynixos.com/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@mynixos" ];
          };
        };
      };
    };
  };
}
