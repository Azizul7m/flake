{ config, host, ... }: {
  networking = {
    hostName = "${host}"; # Define your hostname.
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
      allowedUDPPorts = [ 21027 ]; # Syncthing discovery
    };
  };
  services.openssh = { enable = true; };
}
