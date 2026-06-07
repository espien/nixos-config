{ config, pkgs, ...}:

let myAliases = {
    ll = "ls -l";
    la = "ls -la";
};
in
{
    programs.zsh = {
        enable = true;
        shellAliases = myAliases;
    };
}