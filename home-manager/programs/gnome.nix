{ pkgs, lib, ... }:

{

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs; [
        gnomeExtensions.appindicator.extensionUuid
        gnomeExtensions.blur-my-shell.extensionUuid
        gnomeExtensions.dash-to-dock.extensionUuid
      ];

      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "Alacritty.desktop"
        "codium.desktop"
        "firefox.desktop"
        "idea.desktop"
        "Bolt.desktop"
        "steam.desktop"
        "discord.desktop"
      ];
    };

    # -- Interface --
    "org/gnome/desktop/interface" = {
      accent-color = "purple";
      color-scheme = "prefer-dark";
      toolkit-accessibility = false;
    };

    # -- Dash to Dock --
    "org/gnome/shell/extensions/dash-to-dock" = {
      background-opacity = 0.8;
      dash-max-icon-size = 38;
      dock-position = "BOTTOM";
      height-fraction = 0.8;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "DP-1";
      show-trash = false;
    };

    # Disable mouse-acceleration
    "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";

  };

  home.packages = with pkgs; [
    nautilus
    dconf2nix

    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
  ];
}
