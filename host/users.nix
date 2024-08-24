{ var, inputs, ... }: {
  users.users.${var.user} = {
    isNormalUser = true;
    description = "${var.fullName}";
    extraGroups = [
      "networkmanager"
      "lxd"
      "wheel"
      "mpd"
      "docker"
      "libvirtd"
      "qemu-libvirtd"
    ];
    shell = var.pkgs.fish; # Default shell
  };
}
