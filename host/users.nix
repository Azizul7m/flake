{ global, ...}:
{
  users.users.${global.user} = {
    isNormalUser = true;
    description = "${global.fullName }";
    extraGroups = [ "networkmanager" "wheel" "mpd" "docker" "libvirtd" ];
    shell = global.pkgs.fish; # Default shell
    packages = with global.pkgs; [ ];
  };
}
