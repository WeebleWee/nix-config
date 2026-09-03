{ ... }:

{
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ ];
    allowedUDPPorts = [ ];
    interfaces."wlp8s0".allowedTCPPorts = [ 8080 ];
  };
}
