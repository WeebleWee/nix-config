{ ... }:

{
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    interfaces."wlp8s0".allowedTCPPorts = [ 8080 ];
  };
}
