{ ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
    };
    initContent = ''
      [[ $- == *i* ]] && fastfetch # Run fastfetch only on interactive shells
    '';
  };
}
