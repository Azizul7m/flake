#
# Terminal Emulator
#
# Hardcoded as terminal for rofi and doom emacs
#

{ pkgs, ... }:

{
  programs = {
    alacritty = {
      enable = true;
      settings = {
        font = rec {
          # Font - Laptop has size manually changed at home.nix
          normal.family = "Iosevka";
          bold = { style = "Bold"; };
          size = 10;
        };
        offset = {
          # Positioning
          x = -1;
          y = 0;
        };
        save_to_clipboard = true;
        live_config_reload = true;
        key_bindings = [
          { key = "V"; mods = "Control"; action = "Paste"; }
          { key = "C"; mods = "Control"; action = "Copy"; }
          { key = "Insert"; mods = "Shift"; action = "PasteSelection"; }
          { key = "Key0"; mods = "Control"; action = "ResetFontSize"; }
          { key = "Equals"; mods = "Control"; action = "IncreaseFontSize"; }
          { key = "Plus"; mods = "Control"; action = "IncreaseFontSize"; }
          { key = "Minus"; mods = "Control"; action = "DecreaseFontSize"; }
          { key = "F11"; action = "ToggleFullscreen"; }
          { key = "Paste"; action = "Paste"; }
          { key = "Copy"; action = "Copy"; }
          { key = "L"; mods = "Control"; action = "ClearLogNotice"; }
          #{ key = "L"; mods = "Control"; action = "fzf-cd-widget"; }
          { key = "PageUp"; action = "ScrollPageUp"; mode = "Alt"; }
          { key = "PageDown"; action = "ScrollPageDown"; mode = "Alt"; }
          { key = "Home"; mods = "Shift"; action = "ScrollToTop"; mode = "Alt"; }
          { key = "End"; mods = "Shift"; action = "ScrollToBottom"; mode = "Alt"; }
          # Vi Mode
          { key = "Space"; mode = "Vi"; action = "ScrollToBottom"; }
          { key = "Space"; mods = "Shift"; action = "ToggleViMode"; }
        ];
      };
    };
  };
}
