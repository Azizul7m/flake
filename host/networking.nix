{ host, ... }:

{
  networking = {
    # NetworkManager owns the interfaces. Configure static addresses and
    # sharing profiles in NetworkManager rather than networking.interfaces.
    hostName = "${host}";
    useDHCP = false;
    networkmanager.enable = true;
    interfaces = {
      eno1 = {
        ipv4.addresses = [{
            address = "10.0.0.1";
            prefixLength = 24;
          }];
      };
    };
    defaultGateway={
        address = "";
    };
    firewall = {
      enable = true;
      trustedInterfaces = ["eno1"];
      # Open only ports needed by services on this machine. Remove a port
      # when its corresponding service is no longer used.
      allowedTCPPorts = [
        53 # DNS for the secondary PC
        22 # SSH
        67 # DHCP
        68 # DHCP
        80 # HTTP
        443 # HTTPS
        4747 # Doris cam
        5900 # VNC
        3000 # Next app
        22000 # Syncthing
        8384 # Syncthing GUI
      ];
      allowedUDPPorts = [
        53 # DNS for the secondary PC
        67 # DHCP server
        68 # DHCP client
        4747 # Doris cam
        8384 # Syncthing GUI
        21027 # Syncthing discovery
      ];
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
    };
  };
}
