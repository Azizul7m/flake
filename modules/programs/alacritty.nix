{ config, pkgs, ... }:

{
  programs = {
    alacritty = {
      enable = true;
      settings = {
        general.live_config_reload = true;
        selection.save_to_clipboard = true;
        font.size = 9;
        mouse = { hide_when_typing = true; };
        keyboard.bindings = [
          {
            key = "v";
            mods = "Control";
            action = "Paste";
          }
          {
            key = "C";
            mods = "Control";
            action = "Copy";
          }
          {
            key = "Insert";
            mods = "Shift";
            action = "PasteSelection";
          }
          {
            key = "Key0";
            mods = "Control";
            action = "ResetFontSize";
          }
          {
            key = "Equals";
            mods = "Control";
            action = "IncreaseFontSize";
          }
          {
            key = "Plus";
            mods = "Control";
            action = "IncreaseFontSize";
          }
          {
            key = "Minus";
            mods = "Control";
            action = "DecreaseFontSize";
          }
          {
            key = "F11";
            action = "ToggleFullscreen";
          }
          {
            key = "Paste";
            action = "Paste";
          }
          {
            key = "Copy";
            action = "Copy";
          }
          {
            key = "L";
            mods = "Control";
            action = "ClearLogNotice";
          }
          #{ key = "L"; mods = "Control"; action = "fzf-cd-widget"; }
          {
            key = "PageUp";
            action = "ScrollPageUp";
            mode = "Alt";
          }
          {
            key = "PageDown";
            mode = "Alt";
            action = "ScrollPageDown";
          }
          {
            key = "Home";
            mods = "Shift";
            action = "ScrollToTop";
            mode = "Alt";
          }
          {
            key = "End";
            mods = "Shift";
            action = "ScrollToBottom";
            mode = "Alt";
          }
          # Vi Mode
          {
            key = "Space";
            mode = "Vi";
            action = "ScrollToBottom";
          }
          {
            key = "Space";
            mods = "Shift";
            action = "ToggleViMode";
          }

        ];
      };
    };
  };
}
