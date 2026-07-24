{ lib, ... }:

# Main configuration file for espien.
# Applied together with the system config via `nixos-rebuild switch`.

{
  imports = lib.filesystem.listFilesRecursive ../programs;

  home = {
    username = "espien";
    homeDirectory = "/home/espien";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
