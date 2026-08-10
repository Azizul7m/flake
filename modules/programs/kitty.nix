{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.iosevka;
      name = "Iosevka";
      size = 8;
    };
    themeFile = "Catppuccin-Mocha";
    settings = {
      ## General
      allow_remote_control = "yes";
      dynamic_background_opacity = "yes";
      confirm_os_window_close = 0;

      ## Font
      font_size = 9.0;

      ## Clipboard / Selection
      copy_on_select = "yes";
      select_by_word_characters = ":@-./_~?&=%+#";

      ## Scrolling
      scrollback_lines = 10000;
      wheel_scroll_multiplier = 5.0;

      ## Mouse
      mouse_hide_wait = 3;
      focus_follows_mouse = "no";
      background_opacity = 0.9;
    };

    keybindings = {
      ## Clipboard
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      "shift+insert" = "paste_from_selection";

      ## Font size
      "ctrl+0" = "change_font_size all 0";
      "ctrl+plus" = "change_font_size all +1.0";
      "ctrl+equal" = "change_font_size all +1.0";
      "ctrl+minus" = "change_font_size all -1.0";

      ## Fullscreen
      "f11" = "toggle_fullscreen";

      ## Scrollback (Alt-based like your config)
      "alt+page_up" = "scroll_page_up";
      "alt+page_down" = "scroll_page_down";
      "alt+shift+home" = "scroll_home";
      "alt+shift+end" = "scroll_end";

      ## Clear screen (closest to ClearLogNotice)
      "ctrl+l" = "clear_terminal reset active";
    };

    extraConfig = ''
      # Iosevka does not contain Bengali glyphs. Use the Bengali font only
      # for this script so mixed Bengali/Latin text remains readable.
      symbol_map U+0980-U+09FF Lohit Bengali

      # Mouse bindings (closest match to Alacritty)

      # Left click copies selection
      mouse_map left click ungrabbed copy_to_clipboard

      # Right click paste
      mouse_map right click ungrabbed paste_from_clipboard

      # Ctrl + Left click: open URL
      mouse_map ctrl+left click ungrabbed open_url

      # Middle click: paste selection
      mouse_map middle click ungrabbed paste_from_selection

      # Vi-like scroll mode (kitty scrollback)
      map shift+space toggle_scrollback
    '';
  };
}
