{ config, pkgs, ... }:

# Main configuration file for espien
# After changes are done and validated, run:
#
#   home-manager switch --flake .
#
# and see the magic happen...

let
  packagesRoot = ../packages;
in
{
  imports = [
    "${packagesRoot}/zsh.nix"
    "${packagesRoot}/discord.nix"
    "${packagesRoot}/git.nix"
    "${packagesRoot}/vscodium.nix"
    "${packagesRoot}/fastfetch.nix"
    "${packagesRoot}/firefox.nix"
  ];

  home = {
    username = "espien";
    homeDirectory = "/home/espien";
  };

  programs.home-manager.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home.packages = with pkgs; [
    nixd
    nixfmt-rfc-style
  ];

  home.stateVersion = "26.05";
}
