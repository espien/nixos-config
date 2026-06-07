{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
  ];

  home.username = "eetu";
  home.homeDirectory = "/home/eetu";

  home.stateVersion = "26.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;


  home.packages = [];

  home.file = {};

  home.sessionVariables = {};

  programs.vscodium = {
    enable = true;
  };

  programs.discord = {
    enable = true;
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "espien";
        email = "eetu.pienimaa@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };

  programs.home-manager.enable = true;
}
