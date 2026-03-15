{
  user,
  pkgs,
  fullName,
  ...
}:
{
  users.users.${user} = {
    isNormalUser = true;
    description = "${fullName}";
    extraGroups = [
      "networkmanager"
      "lxd"
      "wheel"
      "mpd"
      "docker"
      "libvirtd"
      "qemu-libvirtd"
      "syncthing"
    ];
    shell = pkgs.fish; # Default shell
  };
}
