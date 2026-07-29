{
  user,
  inputs,
  ...
}:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    ./xdg.nix
    ./gtk.nix
    ./packages.nix
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
    sessionVariables = {
      TERMINAL = "foot";
      BROWSER = "zen";
      EDITOR = "nvim";
      VISUAL = "nvim";
      FLAKE = "~/flake";
      MANPAGER = "less -R"; # To display

      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";

      XDG_SESSION_TYPE = "wayland";
      GDK_BACKEND = "wayland,x11";
      CLUTTER_BACKEND = "wayland";
      SDL_VIDEODRIVER = "wayland";

      QT_QPA_PLATFORM = "wayland;xcb";
      QT_QPA_PLATFORMTHEME = "gtk3";
      QT_QPA_PLATFORMTHEME_QT6 = "gtk3";

      ELECTRON_OZONE_PLATFORM_HINT = "auto";

      # Critical development environment variables
      CC = "clang";
      CXX = "clang++";
      RUSTFLAGS = "-C linker=clang -C link-arg=-fuse-ld=lld";
      ANCHOR_HOME = "$HOME/.anchor";
      POETRY_HOME = "$HOME/.local/share/pypoetry";
    };
  };

  catppuccin = {
    enable = true;
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
