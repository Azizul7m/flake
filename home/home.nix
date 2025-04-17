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
    #../modules/programs/nvim/nvim.nix
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
  home.packages = [ ];

  home.file = {
    # # Bulding this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
  };

  home.sessionVariables = {
    TERMINAL = "alacritty";
    VISUAL = "nvim";
    BROWSER = "google-chrome-stable";
    RUSTUP_HOME = "$HOME/.local";
    CARGO_HOME = "$HOME/.local";
    NODE_PATH = "$HOME/.local";
    PIP_PREFIX = "$HOME/.local/bin";
    ANCHOR_HOME = "$HOME/.anchor";
    NIXPKGS_ALLOW_UNFREE = 1;
    NIXPKGS_ALLOW_INSECURE = 1;
    NIX_CONF_PATH = "~/flake";
  };
  programs = {
    home-manager.enable = true;
    freetube.enable = true;
    zed-editor.enable = true;
    ghostty = {
      enable = true;
      installVimSyntax = true;
      settings = {
        theme = "catppuccin-mocha";
        font-size = 9;
        keybind = [ "ctrl+h=goto_split:left" "ctrl+l=goto_split:right" ];
      };
    };
    git = {
      enable = true;
      userName = "${var.user}";
      userEmail = "${var.userEmail}";
      diff-highlight.enable = true;
    };
  };
  nix = {
    package = pkgs.nix;
    settings = { experimental-features = [ "nix-command" "flakes" ]; };
  };
}
