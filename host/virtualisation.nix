{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    distrobox
    toolbox
    docker-compose
    # lxd-lts # Ensure lxd is explicitly listed
  ];
  virtualisation = {
    # libvirtd = {
    #   enable = true;
    #   qemu.swtpm.enable = true;
    #   qemu = {
    #     ovmf.enable = true;
    #     ovmf.packages = [ var.pkgs.OVMFFull.fd ];
    #   };
    # };
    docker = {
      enable = true;
      rootless = {
        package = pkgs.docker;
        setSocketVariable = true;
        enable = true;
      };
      enableOnBoot = true;
      autoPrune.enable = true;
      extraPackages = with pkgs; [ criu ];
    };
    spiceUSBRedirection.enable = true;
  };
  services = { dockerRegistry.enable = true; };
  # environment.variables = { VAGRANT_DEFAULT_PROVIDER = "libvirt"; };
  boot.kernel.sysctl = {
    "net.ipv4.conf.all.forwarding" = true;
    "net.ipv4.conf.default.forwarding" = true;
  };
  boot.kernelModules = [ "nf_nat_ftp" ];
}
