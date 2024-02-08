{ pkgs, ... }: {
  programs = {
    tmux = {
      enable = true;
      shortcut = "b";
      newSession = true;
      # Stop tmux+escape craziness.
      secureSocket = false;
      terminal = "screen";
      keyMode = "vi";
      resizeAmount = 5;
      clock24 = false;
      customPaneNavigationAndResize = true;
      plugins = with pkgs.tmuxPlugins; [
        yank
        open
        jump
        catppuccin
        better-mouse-mode
      ];
      extraConfig = "
        set -g mouse on 
        set-option -g status-position top
      ";
    };
  };
}
