
{ config, lib, pkgs, ...}: {
  home.packages = with pkgs; [
    crypto-tracker
  ];
    programs = {
        waybar = {
        enable = true;
        package = pkgs.waybar;
        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                height = 25;
                modules-left = [
                    "custom/logo"
                    "hyprland/submap"
                    "hyprland/workspaces"
                    "wlr/taskbar"
                    "hyprland/window"
                ];
                modules-center = [
                    "clock"
                    "network"
                ];
                modules-right = [
                    "mpd"
                    "custom/cryptotracking"
                    "tray"
                    "pulseaudio"
                    "cpu"
                    "battery"
                    "custom/notification"
                ];
                # Modules
                "custom/logo"= {
                    format= " ";
                    on-click= "pkill nwggrid ||nwggrid";
                    tooltip-format= "All Applications";
                };
                "hyprland/submap"= {
                    format= "✌️ {}";
                    max-length= 8;
                    tooltip= true;
                };
                "hyprland/workspaces"= {
                    format= "{icon}";
                };
                "hyprland/window"= {
                    format= " {}";
                    max-length= 28;
                    separate-outputs= true;
                };
                "wlr/taskbar"= {
                    format= "{icon}";
                    icon-size= 13;
                    icon-theme= "Numix-Circle";
                    tooltip-format= "{title}";
                    on-click= "activate";
                    on-click-middle= "close";
                    ignore-list= "[
                       Alacritty
                    ]";
                    "app_ids-mapping"= "{}";
                };

                clock= {
                    tooltip-format= "{:%Y %B}\n<tt><small>{calendar}</small></tt>";
                    format-alt= "{:%Y-%m-%d %I:%M %p}";
                    format= "{:%I:%M %p}";
                    calendar= {
                                mode          = "year";
                                mode-mon-col  = 3;
                                weeks-pos     = "right";
                                on-scroll     = 1;
                                format= {
                                        months=     "<span color='#ffead3'><b>{}</b></span>";
                                        days=       "<span color='#ecc6d9'><b>{}</b></span>";
                                        weeks=      "<span color='#99ffdd'><b>W{}</b></span>";
                                        weekdays=   "<span color='#ffcc66'><b>{}</b></span>";
                                        today=      "<span color='#ff6699'><b><u>{}</u></b></span>";
                                    };
                                };
                            };
                network= {
                    format-wifi= " ↕ {bandwidthTotalBytes}";
                    format-ethernet= "󰈀 ⇣⇡{bandwidthTotalBytes} ";
                    tooltip-format= " {ifname} via {gwaddr}";
                    format-linked= " {ifname} (No IP) ";
                    format-disconnected= "󰤮";
                    format-alt= "{ifname}: {ipaddr}/{cidr}";
                    interval= 3;
                    on-click= "pkill nmtui || alacritty -e nmtui";
                };
                "custom/cryptotracking"= {
                    format= "{}";
                    return-type= "json";
                    exec= "crypto-tracker -k e2bd23eb-64e6-4203-86e7-703e21f49913 -s BTC,ETH,SOL,BNB,XMR,NEAR,TON";
                    restart-interval= 300;
                    on-click= "pkill cointop || alacritty -e cointop";
                };
                pulseaudio= {
                    format= "{volume}% {icon}";
                    format-bluetooth= "{volume}% {icon} {format_source}";
                    format-bluetooth-muted= " {icon} {format_source}";
                    format-muted= " {format_source}";
                    format-source= "{volume}% ";
                    format-source-muted= "";
                    tooltip-format= "{volume}% {icon} {format_source}";
                    format-icons= {
                        headphone= "";
                        hands-free= "";
                        headset= "";
                        phone= "";
                        portable= "";
                        car= "";
                        default= ["" "" ""];
                    };
                    on-click= "pkill pulsemixer || alacritty -e pulsemixer";
                };
                tray= {
                    icon-size= 12;
                    spacing= 2;
                };
                cpu= {
                    format= "{usage}% ";
                    tooltip= true;
                    on-click= "pkill btop || alacritty -e btop";
                };
                battery= {
                    states= {
                        warning= 30;
                        critical= 15;
                    };
                    format= "{icon}";
                    format-charging= "{capacity}% ";
                    format-plugged= "{capacity}% ";
                    format-alt= "{time} {icon}";
                    format-icons= ["" "" "" "" ""];
                };
                "custom/notification"= {
                    tooltip= true;
                    return-type= "json";
                    exec-if= "which swaync-client";
                    exec= "swaync-client -swb";
                    on-click= "swaync-client -t -sw";
                    on-click-right= "swaync-client -d -sw";
                    escape= true;
                    format= "{icon}";
                    format-icons= {
                        notification= "<span foreground='red'><sup></sup></span>";
                        none= "";
                        dnd-notification= "<span foreground='red'><sup></sup></span>";
                        dnd-none= "";
                        inhibited-notification= "<span foreground='red'><sup></sup></span>";
                        inhibited-none= "";
                        dnd-inhibited-notification= "<span foreground='red'><sup></sup></span>";
                        dnd-inhibited-none= "";
                    };
                };
                mpd= {
                    format= "[{elapsedTime:%M:%S}/{totalTime:%M:%S}] {stateIcon} {filename}";
                    format-disconnected= "󰝛";
                    format-stopped= "󰝛";
                    interval= 10;
                    max-length= 28;
                    consume-icons= {"on"= " ";};
                    random-icons= {
                        off= "<span color=\"#f53c3c\"></span> "; 
                        on= " ";
                    };
                    repeat-icons= {on= " ";};
                    single-icons= {on= "1 ";};
                    state-icons= {
                        paused= "";
                        playing= "󰝚";
                    };
                    on-click= "pkill ncmpcpp || alacritty -e ncmpcpp";
                    tooltip-format= "MPD (connected)";
                    tooltip-format-disconnected= "MPD (disconnected)";
                };
            };
        };
        style = ''
            * {
                border: none;
                border-radius: 0;
                padding: 0;
                margin: 0;
                font-size: 12px;
                color: #eee;
            }
            window#waybar{
                padding: 0;
                background-color: rgba(43, 48, 59, 0.4);
            }
            #window #waybar #workspaces{
               padding: 0;
            }
            #workspaces button {
                color: #eee;
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
            #custom,
            #custom-crypto,
            #custom-notification,
            #mpd {
                padding: 0 5px;
                background: transparent;
            }
            #battery.critical:not(.charging) {
                animation-name: blink;
                animation-duration: 0.5s;
                animation-timing-function: linear;
                animation-iteration-count: infinite;
                animation-direction: alternate;
            }

            #workspaces button.urgent {
                background-color: #eb4d4b;
            }
            #tray > .active {
                color: rgba(43, 48, 59, 0.6);
            }
            #custom-crypto{
                background: transparent;
            }
        '';
    };
  };
}
