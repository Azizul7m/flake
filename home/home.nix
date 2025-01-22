{ config, pkgs, var, ... }: {
  imports = [
    ./xdg.nix
    ./packages.nix
    ../modules/ui/gtk.nix
    ../modules/programs/hypr/hyprland.nix
    ../modules/shells/shell.nix
    ../modules/programs/tmux.nix
    ../modules/programs/zoxide.nix
    ../modules/programs/rofi.nix
    ../modules/programs/emacs.nix
    ../modules/programs/nvim/nvim.nix
    ../modules/programs/wofi.nix
    ../modules/programs/fish.nix
    ../modules/programs/hypr/waybar.nix
    ../modules/programs/hypr/swaync.nix
    ../modules/programs/alacritty.nix
    ../modules/programs/vscode.nix
    ../modules/services/mpd.nix
  ];
  home.username = "${var.user}";
  home.homeDirectory = "/home/${var.user}";
  home.stateVersion = "23.05"; # Please read the comment before changing.
  home.packages = [
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
  };

  home.sessionVariables = {
    TERMINAL = "alacritty";
    VISUAL = "nvim";
    BROWSER = "brave";
    RUSTUP_HOME = "$HOME/.local";
    CARGO_HOME = "$HOME/.local";
    NODE_PATH = "$HOME/.local";
    PIP_PREFIX = "$HOME/.local/bin";
    NIXPKGS_ALLOW_UNFREE = 1;
    NIXPKGS_ALLOW_INSECURE = 1;
    NIX_CONF_PATH = "~/flake";
  };
  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "${var.user}";
      userEmail = "${var.userEmail}";
      diff-highlight.enable = true;
    };
  };
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
}
