{ config, host, ... }:

{
  networking = {
    hostName = "${host}";
    useDHCP = false;
    networkmanager.enable = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [
        22 # SSH
        67 # DHCP
        68 # DHCP
        80 # HTTP
        443 # HTTPS
        5900 # VNC
        3000 # Next app
        22000 # Syncthing
        8384 # Syncthing GUI
      ];
      allowedUDPPorts = [
        21027 # Syncthing discovery
      ];
      allowedTCPPortRanges = [{
        from = 1714;
        to = 1764;
      }];
      allowedUDPPortRanges = [{
        from = 1714;
        to = 1764;
      }];
    };
  };

  services.openssh.enable = true;
}

