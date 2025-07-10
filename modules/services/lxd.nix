{ config, lib, pkgs, ...}:

{
  # Enable LXD.
  virtualisation.lxd = {
    enable = true;
    # This turns on a few sysctl settings that the LXD documentation recommends
    # for running in production.
    recommendedSysctlSettings = true;
  };
  networking = {
    useNetworkd = true;
    interfaces.wlp2s0.useDHCP = true;

    bridges.br0.interfaces = [ "wlp2s0" ];

    # Optional: Assign a static IP to br0
    interfaces.br0.ipv4.addresses = [ {
        address = "192.168.1.100";
        prefixLength = 24;
    } ];
    interfaces.br0.ipv4.gateway = "192.168.1.1";
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
  };
  # virtualisation.lxc.defaultConfig = "lxc.include = ''${pkgs.lxcfs}/share/lxc/config/common.conf.d/00-lxcfs.conf";
  virtualisation.lxc.lxcfs.enable = true;

  # ip forwarding is needed for NAT'ing to work.
  boot.kernel.sysctl = {
    "net.ipv4.conf.all.forwarding" = true;
    "net.ipv4.conf.default.forwarding" = true;
  };
  # kernel module for forwarding to work
  boot.kernelModules = [ "nf_nat_ftp" ];
}
