{ inputs, config, var, ... }:
{

  programs = {
    xwayland.enable= true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };
  environment =
    let
      exec = "exec dbus-launch Hyprland";
    in {
    loginShellInit = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
            ${exec}
        fi '';
    sessionVariables = {
       XDG_CURRENT_DESKTOP = "Hyprland";
       XDG_SESSION_TYPE = "wayland";
       XDG_SESSION_DESKTOP = "Hyprland";

      QT_QPA_PLATFORM = "offscreen";  #"wayland"; 
      QT_QPA_PLATFORMTHEM= "kde";
      QT_AUTO_SCREEN_SCALE_FACTOR= "1";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

      
      WLR_NO_HARDWARE_CURSORS = "1";
      MOZ_ENABLE_WAYLAND = "1";
      #NIXOS_OZONE_WL = "1";
    };

    systemPackages = with var.pkgs; [
      qt5.qtwayland
      qt5.qtbase
      qt5.qttools
      qt6Packages.qt6ct
      libsForQt5.qt5.qtwayland

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
      bemenu
      scrot # screenshot utils
      maim # screenshot utils
      wayland-scanner
      wtype
      wlay
      wob # volume gui progress bar
    ];
  };
}
