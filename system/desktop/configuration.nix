{
  inputs,
  lib,
  pkgs,
  ...
}:

# Main configuration entry for the desktop system.
# After changes are done and validated, run:
#
#   sudo nixos-rebuild switch --flake .#desktop
#

{
  imports = [
    ./hardware-configuration.nix
  ]
  ++ lib.filesystem.listFilesRecursive ./modules;

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.nix-vscode-extensions.overlays.default
    ];
  };

  networking.hostName = "desktop";
  networking.networkmanager.enable = true;

  environment.shells = [ pkgs.zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  users.users.espien = {
    isNormalUser = true;
    description = "espien";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    packages = with pkgs; [
      bolt-launcher
    ];
  };

  environment.systemPackages = with pkgs; [
    ripgrep
    curl
    vim
    git
    wget
    qimgv
    qbittorrent

    # -- Development --
    jetbrains.idea

    # -- Nix --
    nixd
    nixfmt
  ];

  system.stateVersion = "26.05";
}
