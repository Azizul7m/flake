{ pkgs, ... }: {
  programs = {
    tmux = {
      enable = true;
      shortcut = "b";
      newSession = true;
      # Stop tmux+escape craziness.
      secureSocket = true;
      terminal = "screen";
      keyMode = "vi";
      resizeAmount = 5;
      clock24 = false;
      customPaneNavigationAndResize = true;
      mouse= true;
      plugins = with pkgs.tmuxPlugins; [
        yank
        open
        jump
        better-mouse-mode
      ];
    extraConfig = ''
        set -g status off
    '';

    };
  };
}
