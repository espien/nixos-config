{ config, pkgs, ... }:

let 
  configRoot = ./modules/home-manager;
in
{
  imports = [
    "${configRoot}/zsh.nix"
    "${configRoot}/discord.nix"
    "${configRoot}/git.nix"
    "${configRoot}/vscodium.nix"
  ];

  home.username = "eetu";
  home.homeDirectory = "/home/eetu";

  home.stateVersion = "26.05";

  nixpkgs.config.allowUnfree = true;

  home.packages = [];

  home.file = {};

  home.sessionVariables = {};

  programs.home-manager.enable = true;
}
