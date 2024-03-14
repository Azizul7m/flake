{ pkgs, ... }:
{
  services.nextcloud = {
    enable = true;
    hostName = "nixos.7m";
    database.createLocally = true;
    # config = {
    #   dbtype = "pgsql";
    #   adminpassFile = "/path/to/admin-pass-file";
    # };
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
