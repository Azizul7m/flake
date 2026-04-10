{ pkgs, lib, ... }:
let
  exec = "exec dbus-launch Hyprland";
in
{
  environment = {
    variables = {
      NIXPKGS_ALLOW_UNFREE = "1";
      LD_LIBRARY_PATH = lib.makeLibraryPath [ pkgs.zlib ];
      PKG_CONFIG_PATH = "${pkgs.systemd.dev}/lib/pkgconfig:${pkgs.zlib.dev}/lib/pkgconfig";
    };
    loginShellInit = ''
            if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
      	echo "Auto login secript try to running"
      	${exec}
            fi
    '';
  };
}
