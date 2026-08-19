{ ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      rebuild = "sudo nixos-rebuild switch";
    };
    initContent = ''
      [[ $- == *i* ]] && fastfetch # Run fastfetch only on interactive shells
    '';
  };
}
