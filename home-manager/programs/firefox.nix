{ ... }:

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
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
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
                name = "YouTube";
                url = "https://www.youtube.com/";
              }
              {
                name = "Reddit";
                url = "https://www.reddit.com/";
              }
              {
                name = "github";
                url = "https://github.com/espien";
              }
              {
                name = "NixOS";
                bookmarks = [
                  {
                    name = "NixOS Packages";
                    url = "https://search.nixos.org/packages";
                  }
                  {
                    name = "MyNixOS";
                    url = "https://mynixos.com/";
                  }
                ];
              }
              {
                name = "Magic";
                bookmarks = [
                  {
                    name = "Cardmarket";
                    url = "https://www.cardmarket.com/en/Magic";
                  }
                  {
                    name = "Moxfield";
                    url = "https://www.moxfield.com/";
                  }
                ];
              }
            ];
          }
        ];
      };
    };
  };
}
