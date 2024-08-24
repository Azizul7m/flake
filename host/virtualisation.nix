{ var, ... }: {
  environment.systemPackages = with var.pkgs; [
    # distrobox
    # toolbox
    lxd-lts # Ensure lxd is explicitly listed
    #vagrant # Lxd like container system
    # boxbuddy
    # virt-manager
    # virt-viewer
    # spice
    # spice-gtk
    # spice-protocol
    # win-virtio
    # win-spice
    # gnome.adwaita-icon-theme
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
    podman = {
      enable = true;
      dockerCompat = true;
    };
    lxd = {
      enable = true;
      ui.enable = true;
      zfsSupport = true;
      recommendedSysctlSettings = true;
    };
    lxc = {
      enable = true;
      lxcfs.enable = true;
      systemConfig = ''
        lxc.lxcpath = /var/lib/lxd/storage-pools
        lxc.bdev.zfs.root = rpool/safe/lxd
      '';
    };
    spiceUSBRedirection.enable = true;
  };
  # services = { spice-vdagentd.enable = true; };
  # environment.variables = { VAGRANT_DEFAULT_PROVIDER = "libvirt"; };
  boot.kernel.sysctl = {
    "net.ipv4.conf.all.forwarding" = true;
    "net.ipv4.conf.default.forwarding" = true;
  };
  boot.kernelModules = [ "nf_nat_ftp"  ];
}
