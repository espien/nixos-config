{ pkgs, ... }:

{
  home.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };

    settings = {
      copy_on_select = "clipboard";
      wheel_scroll_multiplier = 5;

      background_opacity = "0.95";

      enabled_layouts = "splits,stack";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_bar_edge = "top";

      scrollback_lines = 10000;
      enable_audio_bell = "no";
      confirm_os_window_close = 0;
    };

    keybindings = {
      "ctrl+t" = "new_tab";
      "ctrl+q" = "close_tab";
      "ctrl+d" = "next_tab";
      "ctrl+a" = "previous_tab";
    };
  };
}
