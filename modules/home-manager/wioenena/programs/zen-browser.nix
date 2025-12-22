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
    profiles.default = rec {
      containersForce = false;
      pinsForce = true;
      spacesForce = true;
      spaces = {
        Github = {
          id = "ad8f566c-380a-4b10-9af7-00ae5c9d3296";
          icon = "🐙";
          position = 2000;
        };
        Nix = {
          id = "be886168-8d6c-4da5-9d95-3ec287065536";
          icon = "❄️";
          position = 3000;
        };
      };
      pins = {
        "Nix Awesome" = {
          id = "01ad924d-027f-4d4e-a723-9d193e0f0251";
          workspace = spaces.Nix.id;
          isGroup = true;
          isFolderCollapsed = false;
          editedTitle = false;
          position = 200;
        };
        "Nix Packages" = {
          id = "3125e1be-571f-4686-bea9-61c25d377e2d";
          workspace = spaces.Nix.id;
          folderParentId = pins."Nix Awesome".id;
          url = "https://search.nixos.org/packages";
          position = 201;
        };
        "Nix Options" = {
          id = "9f3076c7-b247-451b-a6b4-4f9e42729939";
          workspace = spaces.Nix.id;
          folderParentId = pins."Nix Awesome".id;
          url = "https://search.nixos.org/options";
          position = 202;
        };
        "My NixOS" = {
          id = "56072328-7a63-4e5b-af9a-fd928d108111";
          workspace = spaces.Nix.id;
          folderParentId = pins."Nix Awesome".id;
          url = "https://mynixos.com/";
          position = 203;
        };
      };
      settings = {
        "zen.welcome-screen.seen" = true;
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
