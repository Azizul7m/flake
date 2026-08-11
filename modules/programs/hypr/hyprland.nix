{
  lib,
  pkgs,
  inputs,
  ...
}:
with pkgs;
{
  imports = [
    ##../hypr/hyprpanel.nix
  ];
  home.packages = [
    inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default
    qt5.qtwayland
    qt5.qtbase # for qt apps
    qt5.qttools # for qt apps
    qt6Packages.qt6ct # qt6 config tool
    libsForQt5.qt5ct

    libnotify # notification library
    wofi # application launcher
    wlogout # logout screen
    wireplumber # audio router for pipewire
    brightnessctl # brightness control
    cups-pk-helper

    wayland-protocols # wayland protocols
    wlr-layout-ui # layout switcher
    wf-recorder # screen recorder
    wl-clipboard # clipboard utils

    waypaper # wallpaper utils
    swaybg # wallpaper
    hyprsunset # wallpaper based on time of day
    hyprshot # screenshot tool
    hyprpicker # color picker
    nwg-displays # display manager
    grimblast # screenshot utils
    grim # screenshot utils
    slurp # screenshot utils
    scrot # screenshot utils
    maim # screenshot utils
    wayland-scanner # wayland protocol compiler
    wtype # virtual keyboard
    wlay # window layer tool
    wob # volume gui progress bar
    wev # key cast
  ];
  wayland.windowManager = {
    hyprland = {
      enable = true;
      configType = "lua";
      xwayland.enable = true;
      systemd = {
        enable = true;
        variables = [ "--all" ];
        enableXdgAutostart = true;
      };
      plugins = [ ];
      settings =
        let
          lua = lib.generators.mkLuaInline;
          mod = "mainMod";
          exec = command: lua "hl.dsp.exec_cmd(${builtins.toJSON command})";
          bind = keys: dispatcher: {
            _args = [
              keys
              dispatcher
            ];
          };
          bindWith = keys: dispatcher: opts: {
            _args = [
              keys
              dispatcher
              opts
            ];
          };
          execBind = keys: command: bind keys (exec command);
          execBindWith =
            keys: command: opts:
            bindWith keys (exec command) opts;
          env = [
            [
              "GTK_IM_MODULE"
              "fcitx"
            ]
            [
              "QT_IM_MODULE"
              "fcitx"
            ]
            [
              "XMODIFIERS"
              "@im=fcitx"
            ]
            [
              "XDG_SESSION_TYPE"
              "wayland"
            ]
            [
              "XDG_CURRENT_DESKTOP"
              "Hyprland"
            ]
            [
              "XDG_SESSION_DESKTOP"
              "Hyprland"
            ]
            [
              "GDK_BACKEND"
              "wayland,x11"
            ]
            [
              "QT_QPA_PLATFORM"
              "wayland;xcb"
            ]
            [
              "QT_QPA_PLATFORMTHEME"
              "gtk3"
            ]
            [
              "QT_QPA_PLATFORMTHEME_QT6"
              "gtk3"
            ]
            [
              "ELECTRON_OZONE_PLATFORM_HINT"
              "auto"
            ]
            [
              "SDL_VIDEODRIVER"
              "wayland"
            ]
            [
              "CLUTTER_BACKEND"
              "wayland"
            ]
          ];
          terminal = "footclient";
          browser = "zen";
          fileManager = "nautilus";
          next_input = "fcitx5-remote -t"; # "ibus engine next";
          screenshot = "hyprshot -m region -o ~/Pictures/Screenshots";
        in
        {
          mainMod = {
            _var = "SUPER";
          };
          config = {
            decoration = {
              rounding = 12;
              active_opacity = 1.0;
              inactive_opacity = 1.0;
              blur = {
                enabled = true;
                size = 2;
                passes = 4;
                vibrancy = 0;
                popups = true;
              };
              shadow = {
                enabled = true;
                range = 30;
                render_power = 5;
                offset = "0 2";
                color = "rgba(00000070)";
              };
            };
            input = {
              special_fallthrough = true; # Floating-only special workspaces should not block normal focus.
              focus_on_close = 1;
            };
            general = {
              gaps_in = 5;
              gaps_out = 5;
              border_size = 0;
              col = {
                active_border = "rgba(707070ff)";
                inactive_border = "rgba(d0d0d0ff)";
              };
              layout = "dwindle";
            };
            misc = {
              disable_hyprland_logo = true;
              disable_splash_rendering = true;
            };
          };
          monitor = [
            {
              output = "LVDS-1";
              mode = "1366x768";
              position = "0x0";
              scale = 1;
            }
            {
              output = "DP-1";
              mode = "1366x768";
              position = "0x-768";
              scale = 1;
            }
            {
              output = "";
              mode = "preferred";
              position = "auto";
              scale = 1;
            }
          ];
          env = map (value: { _args = value; }) env;
          on = {
            _args = [
              "hyprland.start"
              (lua ''
                function()
                  hl.exec_cmd("fcitx5 -d &")
                  hl.exec_cmd("openbangla-gui --tray --dark")
                  hl.exec_cmd("wl-paste --type text --watch cliphist store")
                  hl.exec_cmd("wl-paste --type image --watch cliphist store")
                  hl.exec_cmd("systemctl --user is-active --quiet dms.service || systemctl --user start dms.service")
                  hl.exec_cmd("../../../src/hypr/scripts/startup")
                end
              '')
            ];
          };
          layer_rule = {
            name = "dms-no-animation";
            match.namespace = "^(dms)$";
            no_anim = true;
          };
          window_rule = [
            {
              name = "inactive-window-opacity";
              match = {
                float = false;
                focus = false;
              };
              opacity = "1.0 1.0";
            }
            {
              name = "gnome-rounding";
              match.class = "^(org\\.gnome\\.)";
              rounding = 12;
              border_size = 0;
            }
            {
              name = "terminal-no-border";
              match.class = "^(org\\.wezfurlong\\.wezterm|foot|footclient|Alacritty|com\\.mitchellh\\.ghostty|kitty)$";
              border_size = 0;
              float = true;
              opacity= "0.9 0.9";
            }
            {
              name = "float-blueman-manager";
              match.class = "^(blueman-manager)$";
              float = true;
            }
            {
              name = "float-nautilus";
              match.class = "^(org\\.gnome\\.Nautilus)$";
              float = true;
            }
            {
              name = "nomacs";
              match.class = "^(nomacs)$";
              float = true;
            }
            {
              name = "float-dms-quickshell";
              match.class = "^(org\\.quickshell)$";
              float = true;
            }
            {
              name = "mpv";
              match.class = "^(mpv)$";
              float = true;
            }
          ];
          bind = [
            (execBind (lua ''${mod} .. " + RETURN"'') terminal)
            (execBind (lua ''${mod} .. " + CTRL + RETURN"'') "kitty")
            (execBind (lua ''${mod} .. " + B"'') browser)
            (execBind (lua ''${mod} .. " + SHIFT + B"'') "google-chrome-stable")
            (execBind (lua ''${mod} .. " + E"'') fileManager)
            (execBind (lua ''${mod} .. " + SHIFT + E"'') "pcmanfm")
            (execBind (lua ''${mod} .. " + SHIFT + N"'') "waypaper --random")
            (execBind (lua ''${mod} .. " + semicolon"'') next_input)
            (execBind (lua ''${mod} .. " + CTRL + R"'') "hyprctl reload")
            # (bind (lua ''${mod} .. " + SHIFT + RETURN"'') (lua ''hl.dsp.layout("addmaster")''))
            # (bind (lua ''${mod} .. " + ALT + RETURN"'') (lua ''hl.dsp.layout("removemaster")''))
            (bind (lua ''${mod} .. " + CTRL + Q"'') (lua "hl.dsp.exit()"))
            (bind (lua ''${mod} .. " + Q"'') (lua "hl.dsp.window.close()"))
            (bind (lua ''${mod} .. " + A"'') (lua ''hl.dsp.window.float({ action = "toggle" })''))
            (bind (lua ''${mod} .. " + SHIFT + P"'') (lua "hl.dsp.window.pseudo()"))
            (bind (lua ''${mod} .. " + SHIFT + J"'') (lua ''hl.dsp.layout("togglesplit")''))
            (bind (lua ''${mod} .. " + M"'') (lua "hl.dsp.window.fullscreen()"))
            (bind (lua ''${mod} .. " + SHIFT + O"'') (lua "hl.dsp.window.pin()"))
            (bind (lua ''${mod} .. " + TAB"'') (lua "hl.dsp.window.cycle_next()"))
            (bind (lua ''${mod} .. " + SHIFT + U"'') (lua ''hl.dsp.window.move({ workspace = "special" })''))
            (bind (lua ''${mod} .. " + U"'') (lua "hl.dsp.workspace.toggle_special()"))
            (bind (lua ''${mod} .. " + mouse_down"'') (lua ''hl.dsp.focus({ workspace = "e+1" })''))
            (bind (lua ''${mod} .. " + mouse_up"'') (lua ''hl.dsp.focus({ workspace = "e-1" })''))
            (bind (lua ''${mod} .. " + left"'') (lua ''hl.dsp.focus({ direction = "left" })''))
            (bind (lua ''${mod} .. " + right"'') (lua ''hl.dsp.focus({ direction = "right" })''))
            (bind (lua ''${mod} .. " + up"'') (lua ''hl.dsp.focus({ direction = "up" })''))
            (bind (lua ''${mod} .. " + down"'') (lua ''hl.dsp.focus({ direction = "down" })''))
            (bind (lua ''${mod} .. " + H"'') (lua ''hl.dsp.focus({ direction = "left" })''))
            (bind (lua ''${mod} .. " + L"'') (lua ''hl.dsp.focus({ direction = "right" })''))
            (bind (lua ''${mod} .. " + J"'') (lua ''hl.dsp.focus({ direction = "up" })''))
            (bind (lua ''${mod} .. " + K"'') (lua ''hl.dsp.focus({ direction = "down" })''))
            (bind (lua ''${mod} .. " + CTRL + H"'') (lua ''hl.dsp.window.move({ direction = "left" })''))
            (bind (lua ''${mod} .. " + CTRL + L"'') (lua ''hl.dsp.window.move({ direction = "right" })''))
            (bind (lua ''${mod} .. " + CTRL + K"'') (lua ''hl.dsp.window.move({ direction = "up" })''))
            (bind (lua ''${mod} .. " + CTRL + J"'') (lua ''hl.dsp.window.move({ direction = "down" })''))
            (execBind (lua ''${mod} .. " + I"'') "pkill bemenu || bemenu-run -cnwsl 30 -W .45 -p 'Run'")
            (execBind (lua ''${mod} .. " + P"'') "pkill wofi || wofi --show drun -I")
            (execBind "ALT + F4" "dms ipc call lock lock")
            (execBind "ALT + TAB" "dms ipc spotlight toggleQuery '!'")
            (execBind (lua ''${mod} .. " + SPACE"'') "dms ipc call spotlight toggle")
            (execBind (lua ''${mod} .. " + V"'') "dms ipc call clipboard toggle")
            (execBind (lua ''${mod} .. " + T"'') "dms ipc mux toggle")
            (execBind (lua ''${mod} .. " + N"'') "dms ipc call notifications toggle")
            (execBind (lua ''${mod} .. " + CTRL + N"'') "dms ipc call wallpaper next")
            (execBind (lua ''${mod} .. " + CTRL + SHIFT + N"'') "dms ipc call wallpaper previous")
            (execBind (lua ''${mod} .. " + Y"'') "dms ipc call dankdash wallpaper")
            (execBind (lua ''${mod} .. " + CTRL + B"'') "dms ipc call hypr toggleBinds")
            (execBind (lua ''${mod} .. " + CTRL + D"'') "dms ipc welcome doctor")
            (execBind (lua ''${mod} .. " + ALT + L"'') "dms ipc call powermenu toggle")
          ]
          ++ (
            # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
            builtins.concatLists (
              builtins.genList (
                x:
                let
                  workspace = x + 1;
                  ws = builtins.toString (workspace - (((x + 1) / 10) * 10));
                in
                [
                  (bind (lua ''${mod} .. " + ${ws}"'') (lua "hl.dsp.focus({ workspace = ${toString workspace} })"))
                  (bind (lua ''${mod} .. " + SHIFT + ${ws}"'') (
                    lua "hl.dsp.window.move({ workspace = ${toString workspace} })"
                  ))
                ]
              ) 10
            )
          )
          ++ [
            (execBindWith "XF86AudioRaiseVolume" "dms ipc call audio increment 5" {
              locked = true;
              repeating = true;
            })
            (execBindWith "XF86AudioLowerVolume" "dms ipc call audio decrement 5" {
              locked = true;
              repeating = true;
            })
            (execBindWith "XF86AudioNext" "dms ipc call mpris next" { locked = true; })
            (execBindWith "XF86AudioPrev" "dms ipc call mpris previous" { locked = true; })
            (execBindWith "pause" "dms ipc call mpris pause" { locked = true; })
            (execBindWith "XF86AudioPlay" "dms ipc call mpris playPause" { locked = true; })
            (execBindWith "XF86AudioMute" "dms ipc call audio mute" { locked = true; })
            (execBindWith (lua ''${mod} .. " + XF86AudioMute"'') "dms ipc call audio micmute" {
              locked = true;
            })
            (execBindWith "XF86MonBrightnessUp" "dms ipc call brightness increment 5" {
              locked = true;
              repeating = true;
            })
            (execBindWith "XF86MonBrightnessDown" "dms ipc call brightness decrement 5" {
              locked = true;
              repeating = true;
            })
            (bindWith (lua ''${mod} .. " + SHIFT + H"'')
              (lua "hl.dsp.window.resize({ x = -50, y = 0, relative = true })")
              { repeating = true; }
            )
            (bindWith (lua ''${mod} .. " + SHIFT + L"'')
              (lua "hl.dsp.window.resize({ x = 50, y = 0, relative = true })")
              { repeating = true; }
            )
            (bindWith (lua ''${mod} .. " + SHIFT + K"'')
              (lua "hl.dsp.window.resize({ x = 0, y = -50, relative = true })")
              { repeating = true; }
            )
            (bindWith (lua ''${mod} .. " + SHIFT + J"'')
              (lua "hl.dsp.window.resize({ x = 0, y = 50, relative = true })")
              { repeating = true; }
            )
            (bindWith (lua ''${mod} .. " + SHIFT + left"'')
              (lua "hl.dsp.window.resize({ x = -50, y = 0, relative = true })")
              { repeating = true; }
            )
            (bindWith (lua ''${mod} .. " + SHIFT + right"'')
              (lua "hl.dsp.window.resize({ x = 50, y = 0, relative = true })")
              { repeating = true; }
            )
            (bindWith (lua ''${mod} .. " + SHIFT + up"'')
              (lua "hl.dsp.window.resize({ x = 0, y = -50, relative = true })")
              { repeating = true; }
            )
            (bindWith (lua ''${mod} .. " + SHIFT + down"'')
              (lua "hl.dsp.window.resize({ x = 0, y = 50, relative = true })")
              { repeating = true; }
            )
            (execBindWith "print" screenshot { locked = true; })
            (bindWith (lua ''${mod} .. " + mouse:272"'') (lua "hl.dsp.window.drag()") { mouse = true; })
            (bindWith (lua ''${mod} .. " + mouse:273"'') (lua "hl.dsp.window.resize()") { mouse = true; })
          ];
        };
    };
  };
}
