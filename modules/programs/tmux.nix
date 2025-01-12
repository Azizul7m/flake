{ config, pkgs, ... }: {
  programs = {
    tmux = {
      enable = true;
      aggressiveResize = true;
      historyLimit = 10000;
      keyMode = "vi";
      resizeAmount = 10;
      tmuxinator.enable = true;
      plugins = with pkgs; [
        tmuxPlugins.cpu
        {
          plugin = tmuxPlugins.resurrenct;
          extraConfig = "set -g @resurrenct-strategy-nvim 'session'";
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '60' # minutes
          '';
        }

      ];
    };
  };
}
