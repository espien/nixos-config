{
  config,
  pkgs,
  nix-vscode-extensions,
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
    "${packagesRoot}/zsh.nix"
    "${packagesRoot}/discord.nix"
    "${packagesRoot}/git.nix"
    "${packagesRoot}/vscodium.nix"
    "${packagesRoot}/fastfetch.nix"
    "${packagesRoot}/firefox.nix"
  ];

  nixpkgs = {
    overlays = [
      nix-vscode-extensions.overlays.default
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "espien";
    homeDirectory = "/home/espien";
  };

  home.packages = with pkgs; [
    nixd
    nixfmt
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
