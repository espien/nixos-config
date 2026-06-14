{ config, pkgs, ... }:

# Main configuration file for the desktop-system.
# After changes are done and validated, run:
#
#   sudo nixos-rebuild switch --flake .#desktop
#

{
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      # Enable flakes
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  networking.hostName = "desktop";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Helsinki";

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fi_FI.UTF-8";
    LC_IDENTIFICATION = "fi_FI.UTF-8";
    LC_MEASUREMENT = "fi_FI.UTF-8";
    LC_MONETARY = "fi_FI.UTF-8";
    LC_NAME = "fi_FI.UTF-8";
    LC_NUMERIC = "fi_FI.UTF-8";
    LC_PAPER = "fi_FI.UTF-8";
    LC_TELEPHONE = "fi_FI.UTF-8";
    LC_TIME = "fi_FI.UTF-8";
  };

  # Enable KDE
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    kate
    konsole
    qrca
    discover
    gwenview
    kwalletmanager
    kwallet
    spectacle
  ];

  services.xserver.xkb = {
    layout = "fi";
    variant = "winkeys";
  };

  console.keyMap = "fi";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users."espien" = {
    isNormalUser = true;
    description = "espien";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      bolt-launcher
      mullvad-vpn
    ];
  };

  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    alacritty
    vim
    git
    wget
    nixd
    nixfmt
    jetbrains.idea
    openjdk25
    kotlin
    maven
  ];

  system.stateVersion = "26.05";
}
