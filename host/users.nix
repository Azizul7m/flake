{
  user,
  pkgs,
  fullName,
  ...
}:
{
  # The account name and home directory are derived from flake.nix.
  users.users.${user} = {
    isNormalUser = true;
    description = "${fullName}";
    # Add a group only when the matching service is enabled and the user needs
    # direct access to it. Avoid adding users to privileged groups casually.
    extraGroups = [
      "networkmanager"
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
