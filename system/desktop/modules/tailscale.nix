{ lib, ... }:

{
  services.tailscale = {
    enable = true;
    openFirewall = true;
  };
  # Keep tailscaled off by default; start manually when hosting.
  systemd.services.tailscaled.wantedBy = lib.mkForce [ ];

  networking.firewall.interfaces."tailscale0".allowedTCPPorts = [
    5173
    8080
  ];
}
