{ pkgs, user, ... }:
let
  colors = import ../../src/colors/doom.nix;                 # Import colors theme
in
{
  home.packages = [ pkgs.libnotify ]; # Dependency
  services.dunst = {
    enable = true;
    iconTheme = {
      name = "Papirus Dark"; # Icons
      package = pkgs.papirus-icon-theme;
      size = "16x16";
    };
    settings = with colors.doom; {
      global = {
        font = "Iosevka 10";
        plain_text = "no";
        # geometry [{width}x{height}][+/-{x}+/-{y}]
        # geometry = "600x50-50+65";
        geometry = "500x10-5+5";
        width = 300;
        height = 200;
        alignment = "left";
        vertical_alignment = "center";
        origin = "bottom-right";
        offset = "10x10";
        shrink = "yes";
        format = ''
          %a
          <b>%s</b>
          %b'';
        sort = "yes"; # Sort messages by urgency.
        markup = "full";
        indicate_hidden = "yes";
        show_age_threshold = 1; # Set to -1 to disable.
        word_wrap = "yes";
        ignore_newline = "no";
        line_height = 4;
        stack_duplicates = "yes";
        hide_duplicates_count = "no";
        idle_threshold = 120;
        transparency = 40;
        # monitor = keyboard;
        follow = "mouse";
        sticky_history = "yes";
        history_length = 10;
        show_indicators = "yes";
        separator_height = 2;
        padding = 2; # Padding between text and separator.
        horizontal_padding = 2;
        separator_color = "frame";
        startup_notification = true;
        icon_position = "center";
        max_icon_size = 40;
        frame_width = 0;
        #frame_color = "#${bg}";
        # dmenu = "${pkgs.wofi}/bin/wofi --dmenu dunst:"; dmenu path.
        # browser = "/etc/profiles/per-user/${user}/bin/google-chrome-stable --new-tab";  Browser for opening urls in context menu.
      };
      shortcuts = {
        close = "mod4+c"; # Close notification.
        close_all = "mod4+shift+c"; # Close all notifications.
        context = "mod4+n";
      };
      urgency_low = {
        foreground = "#${fg}";
        background = "#${bg}";
        timeout = 5;
      };
      urgency_normal = {
        foreground = "#${fg}";
        background = "#${bg}";
        timeout = 7;
      };

      urgency_critical = {
        frame_width = 1;
        foreground = "#${fg}";
        background = "#${bg}";
        frame_color = "#${red}";
        timeout = 10;
      };
    };
    #[espeak]
    #    summary = "*"
    #    script = dunst_espeak.sh

    #[script-test]
    #    summary = "*script*"
    #    script = dunst_test.sh

    #[ignore]
    #    # This notification will not be displayed
    #    summary = "foobar"
    #    format = ""

    #[signed_on]
    #    appname = Pidgin
    #    summary = "*signed on*"
    #    urgency = low
    #
    #[signed_off]
    #    appname = Pidgin
    #    summary = *signed off*
    #    urgency = low
    #
    #[says]
    #    appname = Pidgin
    #    summary = *says*
    #    urgency = critical
    #
    #[twitter]
    #    appname = Pidgin
    #    summary = *twitter.com*
    #    urgency = normal
    #
    # vim: ft=cfg
  };
}
