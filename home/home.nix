{
  config,
  user,
  inputs,
  pkgs,
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
    ../modules/programs/vscode.nix
    ../modules/services/mpd.nix
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "23.05"; # Please read the comment before changing.
    sessionVariables = {
      TERMINAL = "alacritty";
      BROWSER = "$HOME/Applications/zen-x86_64.AppImage";
      EDITOR = "nvim";
      VISUAL = "nvim";
      ANCHOR_HOME = "$HOME/.anchor";
      MANPAGER = "less -R"; # To display
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";
      FLAKE = "~/flake";
      # Critical development environment variables
      CC = "clang";
      CXX = "clang++";
      RUSTFLAGS = "-C linker=clang -C link-arg=-fuse-ld=lld";
    };
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
    wayvnc = {
      enable = true; # Enable WayVNC service
      settings = {
        address = "0.0.0.0";
        port = 9000;
      };
    };
    emacs = {
      enable = true;
      client.enable = true;
      defaultEditor = false;
      socketActivation.enable = true;
    };
  };
}
