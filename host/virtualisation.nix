{
  pkgs,
  inputs,
  user,
  system ? pkgs.system,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    #    freerdp
    # virt-manager
    # virt-viewer
    distrobox
    docker-compose
    docker-buildx
    dockfmt # Dockerfile formatter
    docker-ls # Language server
    lazydocker # Docker UI
    # lxd-lts # Ensure lxd is explicitly listed
  ];
  virtualisation = {
    # libvirtd = {
    #   enable = true;
    #   qemu = {
    #     package = pkgs.qemu_kvm;
    #     runAsRoot = true;
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
      daemon.settings = {
        data-root = "/home/${user}/store_drive/.sys/docker";
        log-driver = "json-file";
        log-opts = {
          "max-size" = "100m";
          "max-file" = "3";
        };
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services = {
    dockerRegistry.enable = true;
  };
  systemd.services.docker.serviceConfig.RequiresMountsFor = [
    "/home/${user}/store_drive/.sys/docker-storage"
  ];
  # environment.variables = { VAGRANT_DEFAULT_PROVIDER = "libvirt"; };
  boot.kernel.sysctl = {
    "net.ipv4.conf.all.forwarding" = true;
    "net.ipv4.conf.default.forwarding" = true;
  };
  boot.kernelModules = [ "nf_nat_ftp" ];
}
