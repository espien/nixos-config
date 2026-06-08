{ config, pkgs, ... }:

{
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
}
