{ pkgs, ... }:
{
  programs = {
    tmux = {
      enable = true;
      shortcut = "b";
      newSession = true;
      # Stop tmux+escape craziness.
      secureSocket = false;
      terminal = "screen-256color";
      keyMode = "vi";
      resizeAmount = 5;
      customPaneNavigationAndResize = true;
      plugins = [
        pkgs.tmuxPlugins.nord
      ];
    };
    tmate = {
      enable = true;
      # FIXME: This causes tmate to hang.
      # extraConfig = config.xdg.configFile."tmux/tmux.conf".text;
    };
  };
}
