{ var, inputs, ... }: {
  users.users.${var.user} = {
    isNormalUser = true;
    description = "${var.fullName}";
    extraGroups = [ "networkmanager" "wheel" "mpd" "docker" "libvirtd" ];
    shell = var.pkgs.fish; # Default shell
    packages = with var.pkgs; [
      starship
      eza
    ];
  };
}
