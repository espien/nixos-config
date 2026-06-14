{
  config,
  pkgs,
  ...
}:
{
  programs.vscodium = {

    enable = true;

    profiles.default = {

      extensions = with pkgs.nix-vscode-extensions.open-vsx; [
        jnoortheen.nix-ide
        eamodio.gitlens
      ];

      userSettings = {
        "files.autosave" = "off";
        "editor.formatOnSave" = true;
        "editor.tabSize" = 2;

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.serverSettings" = {
          "nixd" = {
            "formatting" = {
              "command" = [ "nixfmt" ];
            };
          };
        };
      };
    };
  };
}
