{ var, ... }: {
  # Install necessary packages
  environment.systemPackages = with var.pkgs; [
    distrobox
    toolbox
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
    docker = {
      enable = true;
      extraOptions = ''
          --data-root=/tmp/docker
      '';
     };
     # podman = {
     #   enable = true;
     #   dockerCompat = true; # Create a `docker` alias for podman,
       # extraOptions = ''
       #   --storage-driver=overlay
       #   --storage-opt=runroot= /tmp/podman
       # '';
    # };                         
    spiceUSBRedirection.enable = true;
  };
  services = {
    spice-vdagentd.enable = true;
  };
}
