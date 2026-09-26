{ pkgs, ... }:

{
  programs.vscodium = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.open-vsx; [
        jnoortheen.nix-ide
        eamodio.gitlens
      ];

      userSettings = {
        "files.autosave" = "off";
        "editor.formatOnSave" = true;
        "editor.tabSize" = 2;

        # [ Nix ]
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.serverSettings" = {
          "nixd" = {
            "formatting" = {
              "command" = [ "nixfmt" ];
            };
          };
        };
        "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
      };
    };
  };
}
