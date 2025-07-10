{ config, host, ... }: {
  networking = {
    hostName = "${host}"; # Define your hostname.
    useDHCP = false;
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 67 68 80 443 5900 ];
      allowedUDPPortRanges = [{
        from = 3000;
        to = 3007;
      }];
    };
  };
  services.openssh = { enable = true; };
}
