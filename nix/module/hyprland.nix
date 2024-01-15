{ config, pkgs, lib, user, ... }:
let 
  exec = "exec Hyprland";
in
{
  lib.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];
  programs= {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };
  environment = {
    systemPackages = with pkgs; [
      nwg-look
      nwg-launchers
      wlogout
      wlr-randr # Screen Settings
      swaylock
      swaynotificationcenter # notifications
      libnotify
      wlprop
      wayland
      wayland-scanner
      wayland-utils
      egl-wayland
      wf-recorder
      wayland-protocols
      wl-clipboard
      waypaper # wallpaper selector
      swaybg # wallpaper
      glfw-wayland
      eww
      slurp
      wofi
      rofi-wayland
      bemenu
    ];
    loginShellInit = ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        ${exec}
      fi
    ''; # Will automatically open Hyprland when logged into tty1
    variables = {
      TERMINAL = "alacritty";
      EDITOR = "nvim";
      VISUAL = "emacs";
      NODE_PATH = "$HOME/.npm_global";
      PIP_PREFIX = "$HOME/.local/bin";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
    };
    sessionVariables = {
      # QT_QPA_PLATFORM = "wayland";
      # QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      GDK_BACKEND = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      #WLR_NO_HARDWARE_CURSORS = "1";
    };
  };
}
