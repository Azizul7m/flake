{ config, pkgs, lib, user, ... }:

{
  lib.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];
  programs.waybar =
    {
      enable = true;
      systemd.enable = true;
      style = ''
        @define-color critical #ff0000; /* critical color */
        @define-color warning #f3f809;  /* warning color */
        @define-color fgcolor #ffffff;  /* foreground color */
        @define-color bgcolor #303030;  /* background color */
        @define-color bgcolor #222436;  /* background color */
        @define-color alert   #df3320;

        /* ROSE PINE */
        @define-color accent1 #eb6f92;
        @define-color accent2 #9ccfd8;
        @define-color accent3 #f6c177;
        @define-color accent4 #31748f;
        @define-color accent5 #c4a7e7;
        @define-color accent6 #ebbcba;

        /* DRACULA */
        @define-color accent1 #ff5555;
        @define-color accent2 #50fa7b;
        @define-color accent3 #f1fa8c;
        @define-color accent4 #bd93f9;
        @define-color accent5 #ff79c6;
        @define-color accent6 #8be9fd;

        /* MONOKAI PRO */
        @define-color accent1 #ff6188;
        @define-color accent2 #a9dc76;
        @define-color accent3 #ffd866;
        @define-color accent4 #fc9867;
        @define-color accent5 #ab9df2;
        @define-color accent6 #78dce8;

        /* TOKYO NIGHT */
        @define-color accent1 #ff7a93;
        @define-color accent2 #b9f27c;
        @define-color accent3 #ff9e64;
        @define-color accent4 #bb9af7;
        @define-color accent5 #7da6ff;
        @define-color accent6 #0db9d7;

        * {
            /* `otf-font-awesome` is required to be installed for icons */
            font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
            font-size: 11px;
        }

        window#waybar {
            background-color: rgba(43, 48, 59, 0.5);
            /* border-bottom: 3px solid rgba(100, 114, 125, 0.5); */
            color: @fgcolor;
            transition-property: background-color;
            transition-duration: .5s;
        }

        window#waybar.hidden {
            opacity: 0.2;
        }

        /*
        window#waybar.empty {
            background-color: transparent;
        }
        window#waybar.solo {
            background-color: #FFFFFF;
        }
        */

        window#waybar.termite {
            background-color: @bgcolor;
        }

        window#waybar.chromium {
            background-color: #000000;
            border: none;
        }

        button {
            /* Use box-shadow instead of border so the text isn't offset */
            box-shadow: inset 0 -3px transparent;
            /* Avoid rounded borders under each button name */
            border: none;
            border-radius: 0;
        }

        /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
        button:hover {
            background: inherit;
            box-shadow: inset 0 -3px #ffffff;
        }

        #workspaces button {
            padding: 0 5px;
            background-color: transparent;
            color: #ffffff;
        }

        #workspaces button:hover {
            background: rgba(0, 0, 0, 0.2);
        }

        #workspaces button.focused {
            background-color: #64727D;
            box-shadow: inset 0 -3px #ffffff;
        }

        #workspaces button.urgent {
            background-color: #eb4d4b;
        }

        #mode {
            background-color: #64727D;
            border-bottom: 3px solid #ffffff;
        }

        #clock,
        #battery,
        #cpu,
        #memory,
        #disk,
        #temperature,
        #backlight,
        #network,
        #pulseaudio,
        #wireplumber,
        #custom-media,
        #tray,
        #mode,
        #idle_inhibitor,
        #scratchpad,
        #mpd {
            padding: 0 5px;
            color: @fgcolor;
            background: transparent;
        }

        #window,
        #workspaces {
            margin: 0 4px;
        }

        /* If workspaces is the leftmost module, omit left margin */
        .modules-left > widget:first-child > #workspaces {
            margin-left: 0;
        }

        /* If workspaces is the rightmost module, omit right margin */
        .modules-right > widget:last-child > #workspaces {
            margin-right: 0;
        }

        #clock {
            /* color: @fgcolor; */
        }

        #battery {
            /* color: @fgcolor; */
        }

        #battery.charging, #battery.plugged {
            /* color: #26A65B; */
        }

        @keyframes blink {
            to {
                background-color: #ffffff;
                color: #000000;
            }
        }

        #battery.critical:not(.charging) {
            /* background-color: #f53c3c; */
            /* color: #ffffff; */
            animation-name: blink;
            animation-duration: 0.5s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
            animation-direction: alternate;
        }

        label:focus {
            /* background-color: #000000; */
        }

        #cpu {
            /* background-color: #2ecc71; */
            /* color: #000000; */
        }

        #memory {
            /* background-color: #9b59b6; */
        }

        #disk {
            /* background-color: #964B00; */
        }

        #backlight {
            /* background-color: #90b1b1; */
        }

        #network {
            /* background-color: #2980b9; */
        }

        #network.disconnected {
            /* background-color: #f53c3c; */
        }

        #pulseaudio {
            /* background-color: #f1c40f; */
            /* color: #000000; */
        }

        #pulseaudio.muted {
            /* background-color: #90b1b1; */
            /* color: #2a5c45; */
        }

        #wireplumber {
            /* background-color: #fff0f5; */
            /* color: #000000; */
        }

        #wireplumber.muted {
            /* background-color: #f53c3c; */
        }

        #custom-media {
            /* background-color: #66cc99; */
            /* color: #2a5c45; */
            /* min-width: 100px; */
        }

        #custom-media.custom-spotify {
            /* background-color: #66cc99; */
        }

        #custom-media.custom-vlc {
            /* background-color: #ffa000; */
        }

        #temperature {
            /* background-color: #f0932b; */
        }

        #temperature.critical {
            /* background-color: #eb4d4b; */
        }

        #tray {
            /* background-color: #2980b9; */
        }

        #tray > .passive {
            -gtk-icon-effect: dim;
        }

        #tray > .needs-attention {
            -gtk-icon-effect: highlight;
            /* background-color: #eb4d4b; */
        }

        #idle_inhibitor {
            /* background-color: #2d3436; */
        }

        #idle_inhibitor.activated {
            /* background-color: #ecf0f1; */
            /* color: #2d3436; */
        }

        #mpd {
            /* background-color: #66cc99; */
            /* color: #2a5c45; */
        }

        #mpd.disconnected {
            /* background-color: #f53c3c; */
        }

        #mpd.stopped {
            /* background-color: #90b1b1; */
        }

        #mpd.paused {
            /* background-color: #51a37a; */
        }

        #language {
            /* background: #00b093; */
            /* color: #740864; */
            /* padding: 0 5px; */
            /* margin: 0 5px; */
            /* min-width: 16px; */
        }

        #keyboard-state {
            /* background: #97e1ad; */
            /* color: #000000; */
            /* padding: 0 0px; */
            /* margin: 0 5px; */
            /* min-width: 16px; */
        }

        #keyboard-state > label {
            /* padding: 0 5px; */
        }

        #keyboard-state > label.locked {
            /* background: rgba(0, 0, 0, 0.2); */
        }

        #scratchpad {
            /* background: rgba(0, 0, 0, 0.2); */
        }

        #scratchpad.empty {
          /* background-color: transparent; */
        }
      '';
      settings = [
        {
          height = 20;
          layer = "top";
          position = "top";
          tray = { spacing = 12; };
          modules-left = [ "wlr/workspaces" "hyprland/window" ];
          modules-center = [ "sway/window" "clock" ];
          modules-right = [
            "network"
            "pulseaudio"
            "cpu"
            "memory"
            "temperature"
            "battery"
            "tray"
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
            on-scroll-up = "hyprctl dispatch workspace e+1";
            on-scroll-down = "hyprctl dispatch workspace e-1";
          };
          "hyprland/window" = {
            format = "{}";
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
            interval = 1;
            format-ethernet = "⬆{bandwidthUpBits}:⬇{bandwidthDownBits}";
            format-disconnected = "Disconnected ⚠";
            format-alt = "{ifname}: {ipaddr}/{cidr} ";
            format-linked = "{ifname} (No IP) ";
            format-wifi = "{essid} ({signalStrength}%) ";
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
          "sway/mode" = { format = '' < span style="italic">{}</span>''; };
          temperature = {
            critical-threshold = 80;
            format = "{temperatureC}°C {icon}";
            format-icons = [ "" "" "" ];
          };
        }
      ];
    };
}
