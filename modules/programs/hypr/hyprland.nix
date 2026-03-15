{ pkgs, inputs, ... }:
with pkgs;
{
  imports = [
    ##../hypr/hyprpanel.nix
  ];
  home.packages = [
    inputs.dms.packages.${pkgs.system}.default
    qt5.qtwayland
    qt5.qtbase # for qt apps
    qt5.qttools # for qt apps
    qt6Packages.qt6ct # qt6 config tool
    libsForQt5.qt5.qtwayland # for qt5 apps

    libnotify # notification library
    wofi # application launcher
    wlogout # logout screen
    wireplumber # audio router for pipewire
    brightnessctl # brightness control

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
      xwayland.enable = true;
      systemd = {
        enable = true;
        variables = [ "--all" ];
        enableXdgAutostart = true;
      };
      plugins = [ ];
      settings =
        let
          env = [
            # "GTK_IM_MODULE,fcitx"
            "QT_IM_MODULE,fcitx"
            "XMODIFIERS,@im=fcitx"
            #"IBUS_USE_PORTAL,1"

            "XDG_SESSION_TYPE,wayland"
            "XDG_CURRENT_DESKTOP,Hyprland"
            "XDG_SESSION_DESKTOP,Hyprland"

            "GDK_BACKEND,wayland,x11"
            "QT_QPA_PLATFORM,wayland;xcb"
            "SDL_VIDEODRIVER,wayland"
            "CLUTTER_BACKEND,wayland"

            # "MOZ_ENABLE_WAYLAND,1"
            # "ELECTRON_OZONE_PLATFORM_HINT,auto"
          ];
          terminal = "kitty";
          browser = "~/Applications/zen-x86_64.AppImage";
          fileManager = "nautilus";
          emacsTerminal = "emacsclient  -c";
          next_input = "fcitx5-remote -t"; # "ibus engine next";
          screenshot = "hyprshot -m region -o ~/Pictures/Screenshots";
        in
        {
          decoration = {
            rounding = 5;
            blur = {
              enabled = true;
              size = 2;
              passes = 4;
              vibrancy = 0;
              popups = true;
            };
          };
          gesture = [ "3, down, scale: 1.5, float" ];
          #master= {
          #new_is_master = true;
          #};
          monitor = [
            "LVDS-1, 1366x768, 0x0, 1"
            "DP-1, 1366x768, 0x-768, 1"
            ", preferred, auto, 1"
          ];
          env = env;
          #cursor = { enable_hyprcursor = true; };
          input = {
            special_fallthrough = true; # having only floating windows in the special workspace will not block focusing windows in the regular workspace.
            focus_on_close = 1; # focus will shift to the window under the cursor.
          };
          general = {
            gaps_in = 3;
            gaps_out = 5;
            border_size = 0;
            "col.active_border" = "rgba(1affffee)";
            "col.inactive_border" = "rgba(595959aa)";
            layout = "dwindle";
          };
          dwindle = {
            pseudotile = true;
            preserve_split = true;
          };
          exec-once = [
            #  "waybar"
            #  "swaync"
            #  "waypaper --restore"
            # "nm-applet"
            # Start DMS through systemd user service (single instance + working IPC)
            # "kdeconnect-indicator &"
            # "qbittorrent"
            "blueman-applet &"
            "fcitx5 -d &"
            "openbangla-gui --tray --dark"
            "wl-paste --type text --watch cliphist store"
            "wl-paste --type image --watch cliphist store"
            "systemctl --user is-active --quiet dms.service || systemctl --user start dms.service"
            "../../../src/hypr/scripts/startup"
          ];
          "$mod" = "SUPER";
          bind = [
            # mouse movements
            "$mod, RETURN, exec, ${terminal}"
            "$mod CONTROL, RETURN, exec, xterm"
            "$mod, b, exec, ${browser}"
            "$mod SHIFT, B, exec, google-chrome-stable"

            "$mod, V, exec, roficlip"
            "$mod, E, exec,  ${fileManager}"
            "$mod SHIFT, E, exec, pcmanfm"
            "$mod SHIFT, N, exec, waypaper --random"
            "$mod, ;, exec, ${next_input}"
            # Hyprland Control
            "$mod CONTROL, R, exec, hyprctl reload"
            "$mod SHIFT, RETUR, layoutmsg, addmaster"
            "$mod ALT, RETURN, layoutmsg, removemaster"
            # Power
            "$mod CONTROL, Q, exit,"
            "$mod, Q, killactive,"
            #Layout
            "$mod, f, togglefloating,"
            "$mod SHIFT, P, pseudo, "
            "$mod SHIFT, J, togglesplit, "
            "$mod, M, fullscreen"
            "$mod SHIFT, o, pin"
            "$mod,Tab,cyclenext" # change focus to another window
            # Special workspace
            "$mod SHIFT, U, movetoworkspace, special"
            "$mod, U, togglespecialworkspace,"
            #"$mod, ., ${pkgs.ibus-layout-toggle}"
            # Scroll through existing workspaces with mainMod + scroll
            "$mod, mouse_down, workspace, e+1"
            "$mod, mouse_up, workspace, e-1"
            # Move focus with mainMod + arrow keys
            "$mod, left, movefocus, l"
            "$mod, right, movefocus, r"
            "$mod, up, movefocus, u"
            "$mod, down, movefocus, d"
            # Move focus with mainMod + arrow keys
            "$mod, H, movefocus, l"
            "$mod, L, movefocus, r"
            "$mod, J, movefocus, u"
            "$mod, K, movefocus, d"
            # Move
            "$mod CTRL, H, movewindow, l"
            "$mod CTRL, L, movewindow, r"
            "$mod CTRL, K, movewindow, u"
            "$mod CTRL, J, movewindow, d"

          ]
          ++ (
            # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
            builtins.concatLists (
              builtins.genList (
                x:
                let
                  ws =
                    let
                      c = (x + 1) / 10;
                    in
                    builtins.toString (x + 1 - (c * 10));
                in
                [
                  "$mod, ${ws}, workspace, ${toString (x + 1)}"
                  "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
                ]
              ) 10
            )
          );
          #volume button that allows press and hold, volume limited to 150%
          binde = [
            ", XF86AudioRaiseVolume, exec, dms ipc call audio increment '5'"
            ", XF86AudioLowerVolume, exec, dms ipc call audio decrement '5'"

            ", XF86AudioNext, exec, dms ipc call mpris next"
            ", XF86AudioPrev, exec, dms ipc call mpris previous"

            "$mod  SHIFT, H, resizeactive,-50 0"
            "$mod  SHIFT, L, resizeactive,50 0"
            "$mod  SHIFT, K, resizeactive,0 -50"
            "$mod  SHIFT, J, resizeactive,0 50"

            "$mod SHIFT, left, resizeactive,-50 0"
            "$mod SHIFT, right, resizeactive,50 0"
            "$mod SHIFT, up, resizeactive,0 -50"
            "$mod SHIFT, down, resizeactive,0 50"

          ];
          #volume button that will activate even while an input inhibitor is active
          bindl = [
            ", print, exec, ${screenshot}"
          ];
          #Start wofi opens wofi on first press, closes it on second
          bindr = [
            # Launcher
            "$mod, i, exec, pkill bemenu || bemenu-run -cnwsl 30 -W .45 -p 'Run'"
            "$mod, p, exec, pkill wofi || wofi --show drun -I"

            "ALT, F4, exec, dms ipc call powermenu toggle"

            "$mod, SPACE, exec, dms ipc call spotlight toggle"
            "$mod, V, exec, dms ipc call clipboard toggle"
            "$mod, t, exec, dms ipc call notepad toggle"
            "$mod, n, exec, dms ipc call notifications toggle"
            "$mod CONTROL, b, exec, dms ipc call hypr toggleBinds"

            ", pause, exec, dms ipc call mpris pause"
            ", XF86AudioPlay, exec, dms ipc call mpris playPause"
            ", XF86AudioMute, exec, dms ipc call audio mute"
            "$mod, XF86AudioMute, exec, dms ipc call audio micmute"

          ];

          #Describe a bind
          bindd = [ ];
          #mouse binds; key: 272, 273
          bindm = [
            "$mod,mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
          ];
        };
    };
  };
}
