{ host, ... }:

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
        4747 # Doris cam
        5900 # VNC
        3000 # Next app
        22000 # Syncthing
        8384 # Syncthing GUI
      ];
      allowedUDPPorts = [
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

  systemd.services.NetworkManager.serviceConfig = {
    CapabilityBoundingSet = [
      "CAP_CHOWN"
      "CAP_NET_ADMIN"
      "CAP_DAC_OVERRIDE"
      "CAP_NET_RAW"
      "CAP_BPF"
      "CAP_NET_BIND_SERVICE"
      "CAP_SETGID"
      "CAP_SETUID"
      "CAP_SYS_MODULE"
      "CAP_AUDIT_WRITE"
      "CAP_KILL"
      "CAP_SYS_CHROOT"
    ];
    AmbientCapabilities = [ "CAP_CHOWN" ];
  };

  services.openssh.enable = true;
}
