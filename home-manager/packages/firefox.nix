{ config, pkgs, ... }:

# Check: https://github.com/iBurley/nixos/blob/main/apps/firefox.nix

{
  programs.firefox = {
    enable = true;
    policies = {
      AIControls.Default.Value = "blocked";
      AutofillCreditCardEnabled = false;

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };
      };

      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisableForgetButton = true;
      DisableProfileImport = true;

      DontCheckDefaultBrowser = true;
      SkipTermsOfUse = true;

      UserMessaging = {
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        UrlbarInterventions = false;
        SkipOnboarding = true;
        MoreFromMozilla = false;
        FirefoxLabs = false;
      };
    };
    profiles.default = {
      isDefault = true;
      bookmarks = {
        force = true;
        settings = [
          {
            name = "Bookmarks Toolbar";
            toolbar = true;
            bookmarks = [
              {
                name = "NixOS search";
                url = "https://search.nixos.org/packages";
              }
              {
                name = "MyNixOS";
                url = "https://mynixos.com/";
              }
              {
                name = "github";
                url = "https://github.com/espien";
              }
            ];
          }
        ];
      };
    };
  };
}
