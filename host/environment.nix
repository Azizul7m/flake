{ config, pkgs, ... }:
let exec = "exec dbus-launch Hyprland";
in {
  environment = {
    variables = { NIXPKGS_ALLOW_UNFREE = "1"; };
    loginShellInit = ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
          ${exec}
      fi
    '';
  };
}
