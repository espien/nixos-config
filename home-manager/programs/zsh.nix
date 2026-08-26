{ ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      rebuild = "sudo nixos-rebuild switch";
      update = "nix flake update";
    };
    initContent = ''
      [[ $- == *i* ]] && fastfetch # Run fastfetch only on interactive shells
    '';
  };
}
