{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    theme = "alacritty_0_12";
    settings = {
      font = {
        size = 10;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };
}
