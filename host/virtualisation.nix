{ var, ... }: {
  # Install necessary packages
  environment.systemPackages = with var.pkgs; [
    distrobox
    toolbox
    boxbuddy
    #virt-manager
    #virt-viewer
    #spice
    #spice-gtk
    #spice-protocol
    #win-virtio
    #win-spice
    #gnome.adwaita-icon-theme
  ];
    # libvirtd = {
      # enable = true;
      # qemu.swtpm.enable = true;
      # qemu = {
        # ovmf.enable = true;
        # ovmf.packages = [ var.pkgs.OVMFFull.fd ];
      # };
    # };
  virtualisation = {
    spiceUSBRedirection.enable = true;
     docker = {
       enable = true;
     };
     # podman = {
     #   enable = true;
     #   dockerCompat = true; # Create a `docker` alias for podman,
     # };                         
  };
  services.spice-vdagentd.enable = true;
}
