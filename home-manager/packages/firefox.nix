{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
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
            ];
          }
        ];
      };
    };
  };
}
