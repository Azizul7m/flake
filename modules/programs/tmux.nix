{ config, pkgs, ... }:
let
  tmux-which-key = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-which-key";
    version = "2024-01-10";
    src = pkgs.fetchFromGitHub {
      owner = "alexwforsythe";
      repo = "tmux-which-key";
      rev = "main";
      sha256 = "sha256-X7FunHrAexDgAlZfN+JOUJvXFZeyVj9yu6WRnxMEA8E=";
    };
    rtpFilePath = "plugin.sh.tmux";
  };
in {
  xdg.configFile = {
    "tmux/plugins/tmux-which-key/config.yaml".text =
      pkgs.lib.generators.toYAML { } {
        command_alias_start_index = 200;
        # rest of config here
      };
  };
  programs = {
    tmux = {
      enable = true;
      aggressiveResize = true;
      historyLimit = 5000;
      keyMode = "vi";
      resizeAmount = 15;
      tmuxinator.enable = true;
      clock24 = false;
      plugins = with pkgs.tmuxPlugins; [
        cpu
        yank
        extrakto
        tmux-thumbs
        sidebar
        {
          plugin = tmux-which-key;
          extraConfig = ''
            set -g @tmux-which-key-xdg-enable 1;
          '';
        }
        {
          plugin = tmux-floax;
          extraConfig = ''
            set -g @floax-bind '-n M-f'
          '';
        }
        {
          plugin = continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '60' # minutes
          '';
        }
        {
          plugin = session-wizard;
          extraConfig = ''
            set -g @session-wizard 'T M-k' # for multiple key bindings
          '';
        }
        {
          plugin = catppuccin;
          extraConfig = ''
            set -g @catppuccin_flavor 'mocha' # latte, frappe, macchiato or mocha
          '';
        }
      ];
      extraConfig = ''
        set -g mouse on 
        set -g base-index 1
        setw -g pane-base-index 1
        set -g renumber-windows on
        set -g prefix M-i
        bind Space last-window
        set -g status off
        bind s set-option -g status

        # resize window
        bind -r C-j resize-pane -D 15
        bind -r C-k resize-pane -U 15
        bind -r C-h resize-pane -L 15
        bind -r C-l resize-pane -R 15


        # Navigate window
        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R
      '';
    };
  };
}
