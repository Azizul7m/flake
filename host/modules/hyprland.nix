{ inputs, config, var, ... }:
{
  programs = {
    xwayland.enable= true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };
  hardware = { opengl.enable = true; };
  environment =
    let
      exec = "exec dbus-launch Hyprland";
    in {
        # loginShellInit = ''
        #   if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        #       ${exec}
        #   fi '';

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

      GDK_BACKEND = "wayland";
      WLR_NO_HARDWARE_CURSORS = "1";
      MOZ_ENABLE_WAYLAND = "1";
    };

    systemPackages = with var.pkgs; [
      xdg-desktop-portal-hyprland
      kitty
      libnotify
      wofi
      nwg-look
      nwg-launchers
      wlogout
      hyprnome
      wlr-randr # Screen Settings
      swaynotificationcenter # notifications
      libnotify
      wlprop
      waypaper # wallpaper selector
      swaybg # wallpaper
      wf-recorder
      wayland-protocols
      hyprshot
      hyprcursor
      wl-clipboard
      grim
      slurp
      scrot # screenshot utils
      maim # screenshot utils
      wayland-scanner
      wtype
      wlay
      wob # volume gui progress bar
    ];
  };
}
