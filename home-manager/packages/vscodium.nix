{
  config,
  pkgs,
  ...
}:
{
  programs.vscodium = {

    enable = true;

    profiles.default = {
      userSettings = {
        "files.autosave" = "off";
        "editor.formatOnSave" = true;
        "editor.tabSize" = 2;
      };
    };
  };
}
