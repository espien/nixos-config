{ lib, pkgs, ... }:

{
  services.printing.enable = true;

  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.gui.enable = true;

  services.jellyfin = {
    enable = true;
    openFirewall = false;
    user = "espien";
  };
  # Keep jellyfin off by default.
  systemd.services.jellyfin.wantedBy = lib.mkForce [ ];

  programs.steam.enable = true;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };

  environment.systemPackages = [ pkgs.docker-compose ];
}
