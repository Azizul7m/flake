{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    freerdp
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
    #   qemu.swtpm.enable = true;
    #   qemu = {
    #     ovmf.enable = true;
    #     ovmf.packages = [ var.pkgs.OVMFFull.fd ];
    #   };
    # };

oci-containers.containers."windows" = {
    image = "dockur/windows";
    autoStart = true;
    ports = [ "8006:8006" "3389:3389" ];
    volumes = [ "/var/lib/windows:/storage" ];
    environment = {
      DISK_IO = "sata"; # This fixes the drive detection issue
      RAM_SIZE = "4G";
      CPU_CORES = "2";
    };
    extraOptions = [ "--device=/dev/kvm" "--cap-add=NET_ADMIN" ];
  };
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
        log-driver = "json-file";
        log-opts = {
          "max-size" = "100m";
          "max-file" = "3";
        };
      };
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
