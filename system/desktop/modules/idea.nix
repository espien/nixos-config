{
  inputs,
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    (inputs.nix-jetbrains-plugins.lib.buildIdeWithPlugins pkgs "idea" [
      "ru.adelf.idea.dotenv" # .env files support https://plugins.jetbrains.com/plugin/9525--env-files
      "com.nbadal.ktlint"
    ])
  ];
}
