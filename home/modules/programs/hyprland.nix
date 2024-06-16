{ inputs, config, var, ... }:
{
  wayland.windowManager = {
    hyprland= {
      enable=true;
      xwayland.enable = true;
      systemd = {
        enable = true;
        variables = ["--all"];
        enableXdgAutostart = true;
      };
      settings= let
            scriptsDir = "$HOME/.config/hypr/scripts";
            term = "alacritty";
            browser = "brave";
            fileManager= "pcmanfm";
            menu = "pkill wofi || wofi --show drun -I";
            emTerm= "open-vterm-full-window";
      in {
        decoration = {
            shadow_offset = "0 5";
        };
        gestures= {
            workspace_swipe = "yes";
        };
        master= {
            new_is_master = true;
        };
        general = {
            gaps_in = 3;
            gaps_out = 5;
            border_size = 0;
            "col.active_border"= "rgba(1affffee)";
            "col.inactive_border"= "rgba(595959aa)";
            layout = "dwindle";
        };
        decoration= {
            rounding = 5;
            drop_shadow = "no";
            shadow_range = 0;
            shadow_render_power = 1;
            "col.shadow" = "rgba(eaeaeaee)";
            blur= {
                    enabled = true;
                    size = 2;
                    passes = 4;
                    vibrancy = 0.1696;
                    popups = true;
                };
        };
        exec-once= [
          "waybar"
          "swaync"
          "waypaper --restore"
          "kdeconnect-indicator"
          "nm-applet"
          "wl-paste --type text --watch cliphist store"
          "wl-paste --type image --watch cliphist store"
        ]; 
       "$mod" = "SUPER";
        bind = [
            # mouse movements
            "$mod, RETURN, exec, emacsclient -ce '(${emTerm})'"
            "ALT, RETURN, exec, ${term}"
            "$mod CONTROL, RETURN, exec, xterm"
            "$mod, B, exec, ${browser}"
            "$mod ALT, B, exec, firefox"
            "$mod, i, exec, $menu"
            "$mod, V, exec, roficlip"
            "$mod, E, exec, ${fileManager}"
            "$mod SHIFT, E, exec, nautilus"

            # Launcher
            "ALT, SPACE, exec, pkill wofi || wofi --show drun -I"
            "$mod ALT, SPACE, exec, wofi --show run --prompt "
            "$mod, V, exec, cliphist list | wofi -dmenu | cliphist decode | wl-copy"
            "$mod, p, exec,  rofi -show filebrowser"

            # spechal key
            ", print, exec, $screenshot"

            ",XF86AudioPlay, exec, mpc toggle"
            ",XF86AudioNext, exec, mpc next"
            ",XF86AudioPrev, exec, mpc prev"
            ",pause, exec, mpc stop"

            ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
            ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"


            # Notifications
            "$mod, n, exec, swaync-client -t -sw"
            # Hyprland Control
            "$mod CONTROL, R, exec, hyprctl reload"
            "$mod SHIFT, RETUR, layoutmsg, addmaster"
            "$mod ALT, RETURN, layoutmsg, removemaster"
            # Power
            "$mod CONTROL, Q, exit,"
            "$mod, L, exec, wlogout "
            "$mod, Q, killactive,"
            #Layout
            "$mod, SPACE, togglefloating,"
            "$mod SHIFT, P, pseudo, "
            "$mod SHIFT, J, togglesplit, "
            "$mod, M, fullscreen"
            "$mod SHIFT, o, pin"

            "$mod, mouse:272, movewindow"

            # Special workspace
            "$mod SHIFT, U, movetoworkspace, special"
            "$mod, U, togglespecialworkspace,"

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
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10));
      };
    };
  };
  home.packages = with var.pkgs; [
      qt5.qtwayland
      qt5.qtbase
      qt5.qttools
      qt6Packages.qt6ct
      libsForQt5.qt5.qtwayland

      kitty
      libnotify
      wofi
      nwg-look
      nwg-launchers
      wlogout
      hyprnome
      wlr-randr # Screen Settings

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
}

