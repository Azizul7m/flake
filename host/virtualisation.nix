{ var, ... }: {
  # Install necessary packages
  environment.systemPackages = with var.pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    gnome.adwaita-icon-theme
  ];
  virtualisation = {
    spiceUSBRedirection.enable = true;
    podman = {
      enable = true;
      dockerCompat = true; # Create a `docker` alias for podman,
      defaultNetwork.settings.dns_enabled =
        true; # containers talk to each other.
    };
    libvirtd = {
      enable = true;
      qemu.swtpm.enable = true;
      qemu = {
        ovmf.enable = true;
        ovmf.packages = [ var.pkgs.OVMFFull.fd ];
      };
    };
  };
  services.spice-vdagentd.enable = true;
}
