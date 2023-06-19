{ config, pkgs, lib, user, ... }:

{
  # lib.overlays = [
  #   (self: super: {
  #     waybar = super.waybar.overrideAttrs (oldAttrs: {
  #       mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
  #     });
  #   })
  # ];
  programs.waybar =
    {
      enable = true;
      systemd.enable = true;
      settings = [
        {
          height = 20;
          layer = "top";
          position = "top";
          tray = { spacing = 8; };
          modules-left = [ "wlr/workspaces" "hyprland/window" ];
          modules-center = [ "clock" ];
          modules-right = [
            "network"
            "tray"
            "pulseaudio"
            "cpu"
            "memory"
            "temperature"
            "battery"
          ];
          battery = {
            format = "{capacity}% {icon}";
            format-alt = "{time} {icon}";
            format-charging = "{capacity}% ";
            format-icons = [ "" "" "" "" "" ];
            format-plugged = "{capacity}% ";
            states = {
              critical = 15;
              warning = 30;
            };
          };
          "wlr/workspaces" = {
            format = "{icon}";
            on-click = "activate";
            sort-by-number = true;
            on-scroll-up = "hyprctl dispatch workspace e+1";
            on-scroll-down = "hyprctl dispatch workspace e-1";
          };
          "hyprland/window" = {
            format = "{icon}";
            max-length = 80;
            separate-outputs = true;
          };
          clock = {
            format-alt = "{:%Y-%m-%d}";
            format = "{:%I:%M %p}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          };
          cpu = {
            format = "{usage}% ";
            tooltip = false;
          };
          memory = { format = "{}% "; };
          network = {
            #            interval = 1;
            format-ethernet = "⬆{bandwidthUpBits}:⬇{bandwidthDownBits}";
            format-disconnected = "Disconnected ⚠";
            format-alt = "{ifname}: {ipaddr}/{cidr} ";
            format-linked = "{ifname} (No IP) ";
            # format-wifi = "{essid} ({signalStrength}%) ";
            format-wifi = "{signalStrength}% ";
            tooltip = true;
            tooltip-format = ''
              {ifname}
              {ipaddr}/{cidr}
              Up: {bandwidthUpBits}
              Down: {bandwidthDownBits}'';
          };
          pulseaudio = {
            format = "{volume}% {icon} {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-icons = {
              car = "";
              default = [ "" "" "" ];
              handsfree = "";
              headphones = "";
              headset = "";
              phone = "";
              portable = "";
            };
            format-muted = " {format_source}";
            format-source = "{volume}% ";
            format-source-muted = "";
            on-click = "pavucontrol";
          };
          backlight = {
            interval = 2;
            align = 0;
            rotate = 0;
            #"device": "amdgpu_bl0",
            format = "{icon} {percent}%";
            format-icons = [ "" "" "" "" ];
            on-click = "";
            on-click-middle = "";
            on-click-right = "";
            on-update = "";
            on-scroll-up = "brightnessctl s 5%+";
            on-scroll-down = "brightnessctl s 5%";
            smooth-scrolling-threshold = 1;
          };
          temperature = {
            critical-threshold = 80;
            format = "{temperatureC}°C {icon}";
            format-icons = [ "" "" "" ];
          };
        }
      ];
      style = builtins.readFile ./waybar.css;
    };
}
