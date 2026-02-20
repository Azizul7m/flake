{ pkgs, ... }: {
  home.packages = [ pkgs.niri ];

  xdg.configFile."niri/config.kdl".text = ''
    input {
        keyboard {
            xkb {
                layout "us"
            }
        }
        touchpad {
            tap
            dwt
        }
    }

    output "LVDS-1" {
        mode width=1366 height=768
        position x=0 y=0
    }

    output "DP-1" {
        mode width=1366 height=768
        position x=0 y=-768
    }

    layout {
        gaps 5
        center-focused-column "never"
        preset-column-widths {
            proportion 0.33333
            proportion 0.5
            proportion 0.66667
        }
        default-column-width { proportion 0.5; }
        focus-ring { enable false; }
        border {
            enable true
            width 2
            active-color "#1affffee"
            inactive-color "#595959aa"
        }
    }

    spawn-at-startup "fcitx5" "-d"
    spawn-at-startup "kdeconnect-indicator"
    spawn-at-startup "waypaper" "--restore"
    spawn-at-startup "swaync"
    spawn-at-startup "waybar"

    window-rule {
        match app-id="emacs"
        match app-id="alacritty"
        match app-id="kitty"
        match app-id="vscode"
        opacity 0.9
    }

    window-rule {
        match title="Waypaper"
        match title="bemenu"
        match title="Telegram"
        match title="yed"
        match title="rofi"
        match title="screenkey"
        match title="Picture-in-Picture"
        match title="qBittorrent"
        open-floating true
    }

    window-rule {
        match app-id="zoom"
        match app-id="zoom_client"
        open-floating true
    }

    binds {
        Mod+Return { spawn "kitty"; }
        Mod+Shift+Return { spawn "emacsclient" "-cnq"; }
        Mod+B { spawn "google-chrome"; }
        Mod+Alt+B { spawn "firefox"; }
        Mod+E { spawn "nautilus"; }
        Mod+Shift+E { spawn "pcmanfm"; }
        Mod+Q { close-window; }
        Mod+Ctrl+Q { quit; }

        Mod+Space { spawn "sh" "-c" "pkill wofi || wofi --show drun -I"; }
        Mod+I { spawn "sh" "-c" "pkill bemenu || bemenu-run -cnwsl 30 -W .45 -p 'Run'"; }
        Mod+V { spawn "sh" "-c" "pkill wofi || cliphist list | wofi -dmenu | cliphist decode | wl-copy"; }
        Mod+N { spawn "swaync-client" "-t" "-sw"; }
        Mod+Shift+N { spawn "waypaper" "--random"; }
        Mod+Semicolon { spawn "fcitx5-remote" "-t"; }

        Mod+Left  { focus-column-left; }
        Mod+Right { focus-column-right; }
        Mod+Up    { focus-window-or-workspace-up; }
        Mod+Down  { focus-window-or-workspace-down; }

        Mod+H { focus-column-left; }
        Mod+L { focus-column-right; }
        Mod+J { focus-window-or-workspace-down; }
        Mod+K { focus-window-or-workspace-up; }

        Mod+Ctrl+Left  { move-column-left; }
        Mod+Ctrl+Right { move-column-right; }
        Mod+Ctrl+Up    { move-window-up-or-to-workspace-up; }
        Mod+Ctrl+Down  { move-window-down-or-to-workspace-down; }

        Mod+Ctrl+H { move-column-left; }
        Mod+Ctrl+L { move-column-right; }
        Mod+Ctrl+J { move-window-down-or-to-workspace-down; }
        Mod+Ctrl+K { move-window-up-or-to-workspace-up; }

        Mod+Shift+Left  { consume-or-expel-window-left; }
        Mod+Shift+Right { consume-or-expel-window-right; }

        Mod+F { toggle-window-floating; }
        Mod+M { maximize-column; }
        Mod+Shift+M { fullscreen-window; }

        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }

        Mod+Shift+1 { move-column-to-workspace 1; }
        Mod+Shift+2 { move-column-to-workspace 2; }
        Mod+Shift+3 { move-column-to-workspace 3; }
        Mod+Shift+4 { move-column-to-workspace 4; }
        Mod+Shift+5 { move-column-to-workspace 5; }
        Mod+Shift+6 { move-column-to-workspace 6; }
        Mod+Shift+7 { move-column-to-workspace 7; }
        Mod+Shift+8 { move-column-to-workspace 8; }
        Mod+Shift+9 { move-column-to-workspace 9; }

        XF86AudioRaiseVolume { spawn "wpctl" "set-volume" "-l" "1.5" "@DEFAULT_AUDIO_SINK@" "5%+"; }
        XF86AudioLowerVolume { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"; }
        XF86AudioMute { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
        XF86AudioNext { spawn "mpc" "next"; }
        XF86AudioPrev { spawn "mpc" "prev"; }
        XF86AudioPlay { spawn "mpc" "toggle"; }

        Print { spawn "hyprshot" "-m" "region" "-o" "/home/anower/Pictures/Screenshots"; }

        Mod+WheelScrollDown      { focus-workspace-down; }
        Mod+WheelScrollUp        { focus-workspace-up; }
        Mod+Ctrl+WheelScrollDown { move-column-to-workspace-down; }
        Mod+Ctrl+WheelScrollUp   { move-column-to-workspace-up; }

        Mod+Minus { set-column-width "-10%"; }
        Mod+Equal { set-column-width "+10%"; }
        Mod+Shift+Minus { set-window-height "-10%"; }
        Mod+Shift+Equal { set-window-height "+10%"; }

        Mod+Shift+H { set-column-width "-10%"; }
        Mod+Shift+L { set-column-width "+10%"; }
        Mod+Shift+K { set-window-height "-10%"; }
        Mod+Shift+J { set-window-height "+10%"; }

        Mod+R { switch-preset-column-width; }
    }
  '';
}
