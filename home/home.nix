{ config, pkgs, var, ... }:

{
  imports = [
    ./packages.nix
    ../modules/programs/hyprland.nix
    ../modules/shells/shell.nix
    ../modules/programs/zellij.nix
    ../modules/programs/zoxide.nix
    ../modules/programs/rofi.nix
    ../modules/programs/emacs.nix
    ../modules/programs/wofi.nix
    ../modules/programs/fish.nix
    ../modules/programs/waybar.nix
    ../modules/programs/swaync.nix
    ../modules/programs/alacritty.nix
    ../modules/programs/vscode.nix
    ../modules/services/mpd.nix
    ../theme/gtk.nix
  ];
  home.username = "${var.user}";
  home.homeDirectory = "/home/${var.user}";
  home.stateVersion = "23.05"; # Please read the comment before changing.
  home.packages = [
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
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

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  home.sessionVariables = {
     TERMINAL = "alacritty";
     VISUAL = "emacs";
     BROWSER = "firefox";
     NODE_PATH = "$HOME/.npm_global";
     PIP_PREFIX = "$HOME/.local/bin";
     NIXPKGS_ALLOW_UNFREE="1";
  };
  nix = {
    package = pkgs.nix;
    settings.experimental-features = ["nix-command" "flakes"];
  };
  programs = {
    home-manager.enable = true;
  };
}
