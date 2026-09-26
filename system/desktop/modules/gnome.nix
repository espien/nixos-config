{ pkgs, ... }:

{
  services = {
    desktopManager = {
      gnome = {
        enable = true;
      };
    };
    displayManager = {
      gdm = {
        enable = true;
      };
    };
    gnome = {
      core-apps.enable = false;
      core-developer-tools.enable = false;
      games.enable = false;
    };
  };

  programs = {
    xwayland = {
      enable = true;
    };
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];

  # Fix for TexStudio dialog crashing the program
  environment.sessionVariables.XDG_DATA_DIRS = [
    "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
  ];

}
