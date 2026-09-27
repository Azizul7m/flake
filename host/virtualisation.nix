{
  pkgs,
  user ? pkgs.system,
  ...
}:
{
  # These are command-line tools for working with containers. The services
  # themselves are configured in the virtualisation block below.
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
  ];
  virtualisation = {
    # libvirtd = {
    #   enable = true;
    #   qemu = {
    #     package = pkgs.qemu_kvm;
    #     runAsRoot = true;
    #   };
    # };
    # Docker is rootless for normal user commands and also enabled as a
    # system service for compatibility with tools that expect its socket.
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
        # This path must be on a mounted filesystem before Docker starts.
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
  # Prevent Docker from starting before the external storage path is ready.
  systemd.services.docker.serviceConfig.RequiresMountsFor = [
    "/home/${user}/store_drive/.sys/docker-storage"
  ];
  # environment.variables = { VAGRANT_DEFAULT_PROVIDER = "libvirt"; };
  boot.kernel.sysctl = {
    "net.ipv4.conf.all.forwarding" = true;
    "net.ipv4.conf.default.forwarding" = true;
  };
}
