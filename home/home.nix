{ config, pkgs, var, ... }: {
  imports = [
    ./packages.nix
    ./xdg.nix
    ../modules/programs/hyprland.nix
    ../modules/shells/shell.nix
    ../modules/programs/zellij.nix
    ../modules/programs/zoxide.nix
    ../modules/programs/rofi.nix
    ../modules/programs/emacs.nix
    ../modules/programs/nvim/nvim.nix
    ../modules/programs/wofi.nix
    ../modules/programs/fish.nix
    ../modules/programs/waybar.nix
    ../modules/programs/swaync.nix
    ../modules/programs/alacritty.nix
    ../modules/programs/vscode.nix
    ../modules/services/mpd.nix
    ../modules/ui/gtk.nix
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

    # "~/.local/share/wayland-sessions/hyprland.desktop".text = ''
    #           [Desktop Entry]
    #           Name=Hyprland
    #           Comment=Hyprland Wayland session
    #           Exec=${pkgs.hyprland}/bin/Hyprland
    #           Type=Application
    #           Keywords=wayland;hyprland
    #   	'';
  };

  home.sessionVariables = {
    TERMINAL = "alacritty";
    VISUAL = "nvim";
    BROWSER = "brave";
    NODE_PATH = "$HOME/.npm_global";
    PIP_PREFIX = "$HOME/.local/bin";
    NIXPKGS_ALLOW_UNFREE = 1;
    NIXPKGS_ALLOW_INSECURE = 1;
    NIX_CONF_PATH = "~/flake";
  };
  programs = { home-manager.enable = true; };
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
}
