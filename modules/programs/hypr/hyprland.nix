{ inputs, config, pkgs, ... }:
with pkgs; {

  imports = [
    ../../services/hypridle.nix
    #    ../hypr/hyprpanel.nix
    #  ../services/hyprpaper.nix
  ];

  home.packages = [
    qt5.qtwayland
    qt5.qtbase
    qt5.qttools
    qt6Packages.qt6ct
    libsForQt5.qt5.qtwayland

    kitty
    libnotify
    wofi
    wlogout
    wireplumber

    waypaper # wallpaper selector
    swaybg # wallpaper
    wf-recorder
    brightnessctl
    wayland-protocols
    wlr-layout-ui
    wlr-which-key
    hyprsunset
    hyprshot
    hyprpicker
    wl-clipboard
    grimblast
    grim
    slurp
    bemenu
    scrot # screenshot utils
    maim # screenshot utils
    wayland-scanner
    wtype
    wlay
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
      settings = let
        env = [
          "HYPRLAND_LOG_WLR,1"
          "HYPRLAND_TRACE1,1" # Corrected variable name
          "GDK_BACKEND,wayland,x11,*"
          "QT_QPA_PLATFORM,wayland;xcb"
          "SDL_VIDEODRIVER,wayland"
          "CLUTTER_BACKEND,wayland"
          "MOZ_ENABLE_WAYLAND,1"
          "MOZ_WEBRENDER,1"
          "XDG_SESSION_TYPE,wayland"
          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_TYPE,wayland"
          "XDG_SESSION_DESKTOP,Hyprland"
          "XDG_PORTAL_BACKEND,xdg-desktop-portal-hyprland"
        ];
        scriptsDir = "$HOME/.config/hypr/scripts";
        terminal = "alacritty";
        browser = "brave";
        fileManager = "pcmanfm";
        menu = "pkill wofi || wofi --show drun -I";
        emacsTerminal = "emacsclient  -c";
        fctix =
          "fcitx5 -9;sleep 1;fcitx5 -d --replace; sleep 1;fcitx5-remote -r";
        screenshot = "hyprshot -m region -o ~/Pictures/Screenshots";
      in {
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
        gestures = { workspace_swipe = "yes"; };
        #master= {
        #new_is_master = true;
        #};
        monitor = [
          "LVDS-1, 1366x768, 0x0, 1"
          "DP-1, 1366x768, 0x-768, 1"
          ", preferred, auto, 1"
        ];
        env = env;
        general = {
          gaps_in = 3;
          gaps_out = 5;
          border_size = 0;
          "col.active_border" = "rgba(1affffee)";
          "col.inactive_border" = "rgba(595959aa)";
          layout = "dwindle";
        };
        exec-once = [
          "waybar"
          "swaync"
          "waypaper --restore"
          "kdeconnect-indicator"
          "nm-applet"
          "blueman-applet"
          "fcitx5 -d"
          "openbangla-gui --tray --dark"
          "wl-paste --type text --watch cliphist store"
          "wl-paste --type image --watch cliphist store"
          "../../../src/hypr/scripts/startup"
        ];
        # window rules
        windowrulev2 = [
          #Opacity
          "opacity 0.9 0.9, class:^(Emacs|Alacritty|VSCodium)$"

          # telegram media viewer
          "float, title:^(Waypaper|bemenu|Telegram|yed|rofi|screenkey)$"
          "size 340 480, class:^(Waypaper|Telegram|Alacritty)$"

          # make Firefox PiP window floating and sticky
          "float, title:^(Picture-in-Picture)$"
          "pin, title:^(Picture-in-Picture)$"

          # throw sharing indicators away
          "workspace special silent, title:^(Firefox — Sharing Indicator)$"
          "workspace special silent, title:^(.*is sharing (your screen|a window).)$"

          # idle inhibit while watching videos
          "idleinhibit focus, class:^(mpv|.+exe|celluloid)$"
          "idleinhibit focus, class:^(firefox)$, title:^(.*YouTube.*)$"
          "idleinhibit fullscreen, class:^(firefox)$"

          "dimaround, class:^(gcr-prompter)$"
          "dimaround, class:^(xdg-desktop-portal-gtk)$"
          "dimaround, class:^(polkit-gnome-authentication-agent-1)$"
        ];
        "$mod" = "SUPER";
        bind = [
          # mouse movements
          "$mod, RETURN, exec, emacsclient -cnq"
          "ALT, RETURN, exec, ${terminal}"
          "$mod CONTROL, RETURN, exec, xterm"
          "$mod, B, exec, ${browser}"
          "$mod ALT, B, exec, firefox"
          "$mod, i, exec, $menu"
          "$mod, V, exec, roficlip"
          "$mod, E, exec, alacritty -e superfile"
          "$mod SHIFT, E, exec, ${fileManager}"
          "$mod SHIFT, N, exec, waypaper --random"

          # Notifications
          "$mod, n, exec, swaync-client -t -sw"
          "$mod CONTROL, u, exec, ${fctix}"

          # Hyprland Control
          "$mod CONTROL, R, exec, hyprctl reload"
          "$mod SHIFT, RETUR, layoutmsg, addmaster"
          "$mod ALT, RETURN, layoutmsg, removemaster"
          # Power
          "$mod CONTROL, Q, exit,"
          "$mod, Q, killactive,"
          #Layout
          "$mod, SPACE, togglefloating,"
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

        ] ++ (
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList (x:
            let
              ws = let c = (x + 1) / 10;
              in builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]) 10));
        #volume button that allows press and hold, volume limited to 150%
        binde = [
          ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

          ", XF86AudioNext, exec, mpc next"
          ", XF86AudioPrev, exec, mpc prev"

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
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ", XF86AudioPlay, exec, mpc toggle"
          ", pause, exec, mpc stop"
        ];
        #Start wofi opens wofi on first press, closes it on second
        bindr = [
          # Launcher
          "ALT, SPACE, exec, pkill wofi || wofi --show drun -I"
          "$mod SHIFT, SPACE, exec, pkill bemenu || bemenu-run -cnwsl 30 -W .45 -p 'Run'"
          "$mod, V, exec, pkill wofi || cliphist list | wofi -dmenu | cliphist decode | wl-copy"
          "$mod, p, exec, pkill rofi || rofi -show filebrowser"
          "ALT, F4, exec, wlogout "
        ];

        #Describe a bind
        bindd = [ ];
        #mouse binds; key: 272, 273
        bindm = [ "$mod,mouse:272,movewindow" "$mod, mouse:273, resizewindow" ];
      };
    };
  };
}

