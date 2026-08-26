{ lib, pkgs, ... }:

{
  services.printing.enable = true;

  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;

  services.jellyfin = {
    enable = true;
    openFirewall = false;
    user = "espien";
  };
  # Keep jellyfin off by default; start manually when needed.
  systemd.services.jellyfin.wantedBy = lib.mkForce [ ];

  programs.steam.enable = true;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };

  environment.systemPackages = [ pkgs.docker-compose ];
}
