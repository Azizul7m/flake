{ config, pkgs, ... }:
let exec = "exec dbus-launch Hyprland";
in {
  environment = {
    variables = {
      CLUTTER_BACKEND = "wayland";
      SDL_VIDEODRIVER = "wayland";
      MOZ_ENABLE_WAYLAND = 1;
      MOZ_WEBRENDER = 1;
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "hyprland";
      CHROME_IM_MODULE = "fcitx";

      # QT-related theming
      QT_QPA_PLATFORMTHEME = "kde";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_IM_MODULES = "wayland;fcitx;ibus";
      #Nix
      NIXPKGS_ALLOW_UNFREE = "1";

      HYPRCURSOR_SIZE = "18"; 
    };
    loginShellInit = ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
          ${exec}
      fi
    '';
  };
}
