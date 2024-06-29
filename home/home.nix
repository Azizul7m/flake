{ config, pkgs, var, ... }:

{
  imports = [
    ./packages.nix
    ./modules/programs/hyprland.nix
    ../home/modules/shells/shell.nix
    ../home/modules/programs/zellij.nix
    ../home/modules/programs/zoxide.nix
    ../home/modules/programs/rofi.nix
    ../home/modules/programs/emacs.nix
    ../home/modules/programs/wofi.nix
    ../home/modules/programs/fish.nix
    ../home/modules/programs/waybar.nix
    ../home/modules/programs/swaync.nix
    ../home/modules/programs/alacritty.nix
    ../home/modules/programs/vscode.nix
    ../home/modules/services/mpd.nix
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
  programs = {
    home-manager.enable = true;
  };
}
