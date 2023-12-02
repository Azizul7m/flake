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
      customPaneNavigationAndResize = true;
      plugins = with pkgs.tmuxPlugins; [
        yank
        open
        jump
        onedark-theme
        better-mouse-mode
      ];
      extraConfig = "set -g mouse on ";
    };
  };
}
