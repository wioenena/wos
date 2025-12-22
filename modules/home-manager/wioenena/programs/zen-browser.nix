{ ... }:
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
      containersForce = true;
      pinsForce = true;
      spacesForce = true;
      containers = {
        Work = {
          color = "blue";
          icon = "briefcase";
          id = 1;
        };
        Life = {
          color = "green";
          icon = "tree";
          id = 2;
        };
      };
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
    };
  };
}
