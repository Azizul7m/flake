{ config, var, ... }: {
  networking = {
    hostName = "${var.host}"; # Define your hostname.
    useDHCP = false;
    networkmanager.enable = true;
    # stevenblack = {
    #   enable = true;
    #   block = [ "fakenews" "gambling" "porn" ];
    # };
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 67 68 80 443 ];
      allowedUDPPortRanges = [
        {from = 3000;
          to = 3007;}
      ];
    };
  };
  services.openssh = { enable = true; };
  # systemd.packages = [ var.pkgs.cloudflare-warp ];
  # systemd.services."warp-svc".wantedBy = [ "multi-user.target" ];
  # environment.systemPackages = [ var.pkgs.cloudflare-warp ];
}
