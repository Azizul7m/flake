{
  user,
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    ./xdg.nix
    ./gtk.nix
    ./packages.nix
    ./session_variables.nix
    ../modules/programs/hypr/hyprland.nix
    ../modules/shells/shell.nix
    ../modules/programs/tmux.nix
    ../modules/programs/zoxide.nix
    ../modules/programs/emacs.nix
    ../modules/programs/wofi.nix
    ../modules/programs/fish.nix
    #    ../modules/programs/niri.nix
    #    ../modules/programs/hypr/waybar.nix
    #    ../modules/programs/hypr/swaync.nix
    ../modules/programs/alacritty.nix
    ../modules/programs/kitty.nix
    ../modules/programs/foot.nix
    ../modules/services/mpd.nix
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "23.05"; # Please read the comment before changing.
  };

  catppuccin = {
    autoEnable = true;
    flavor = "mocha";
  };

  #  gtk = { enable = true; };
  programs = {
    home-manager.enable = true;
    gitui.enable = true;
    diff-highlight.enable = true;
  };
  services = {
    lorri = {
      enable = true;
      enableNotifications = true;
    };
    syncthing = {
      enable = true;
    }; # Enable Syncthing service
    kdeconnect = {
      enable = true; # Enable KDE Connect service
      indicator = true;
    };
    emacs = {
      enable = true;
      client.enable = true;
      defaultEditor = false;
      socketActivation.enable = true;
    };
  };

  # User systemd service: hold a sleep inhibitor while the quickshell-based DMS runs
  # This checks for a process named "quickshell" owned by the user and blocks suspend while it exists.
  systemd.user.services.dms-inhibit = {
    Unit = {
      Description = "Hold sleep inhibitor while quickshell DMS runs";
    };
    Service = {
      ExecStart = ''
        /run/current-system/sw/bin/systemd-inhibit --what=sleep --why="DMS active" --mode=block \
        /bin/sh -c "while /run/current-system/sw/bin/pgrep -u ${user} quickshell >/dev/null; do sleep 5; done"
      '';
      Restart = "no";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
