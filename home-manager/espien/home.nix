{
  inputs,
  pkgs,
  ...
}:

# Main configuration file for espien
# After changes are done and validated, run:
#
#   home-manager switch --flake .
#

let
  packagesRoot = ../packages;
in
{
  imports = [
    "${packagesRoot}/calibre.nix"
    "${packagesRoot}/zsh.nix"
    "${packagesRoot}/discord.nix"
    "${packagesRoot}/git.nix"
    "${packagesRoot}/vscodium.nix"
    "${packagesRoot}/fastfetch.nix"
    "${packagesRoot}/firefox.nix"
  ];

  nixpkgs = {
    overlays = [
      inputs.nix-vscode-extensions.overlays.default
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "espien";
    homeDirectory = "/home/espien";
  };

  home.packages = [ ];

  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
