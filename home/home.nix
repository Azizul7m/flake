{ config, pkgs, user, userEmail, inputs, ... }: {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    inputs.agenix.homeManagerModules.default
    ./xdg.nix
    ./packages.nix
    ../modules/ui/gtk.nix
    ../modules/programs/hypr/hyprland.nix
    ../modules/shells/shell.nix
    ../modules/programs/tmux.nix
    ../modules/programs/zoxide.nix
    ../modules/programs/emacs.nix
    ../modules/programs/wofi.nix
    ../modules/programs/fish.nix
    ../modules/programs/hypr/waybar.nix
    ../modules/programs/hypr/swaync.nix
    ../modules/programs/alacritty.nix
    ../modules/programs/vscode.nix
    ../modules/services/mpd.nix
  ];

  # 
  age = {
    secrets = {
      gemini = { file = ../secrets/gemini.age; };
      syncthing = { file = ../secrets/syncthing.age; };
    };
  };

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "23.05"; # Please read the comment before changing.
    sessionPath = [
      "${config.home.homeDirectory}/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin"
    ];
    sessionVariables = {
      TERMINAL = "alacritty";
      VISUAL = "nvim";
      BROWSER = "$HOME/Applications/zen-x86_64.AppImage";
      ANCHOR_HOME = "$HOME/.anchor";
      MANPAGER = "less -R"; # To display
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";
      FLAKE = "~/flake";
      # Critical development environment variables
      CC = "clang";
      CXX = "clang++";
      RUSTFLAGS = "-C linker=clang -C link-arg=-fuse-ld=lld";
      GEMINI_API_KEY = "$(cat ${config.age.secrets.gemini.file})";
      #      # Api environment variables
      #      OPENAI_API_KEY_FILE = "$(cat ${config.age.secrets.openai.file})";
      #      GORGON_API_KEY_FILE = "$(cat ${config.age.secrets.groq.file})";
    };
  };

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
    syncthing = { enable = true; }; # Enable Syncthing service
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
      defaultEditor = true;
      socketActivation.enable = true;
    };
  };
  catppuccin = {
    flavor = "mocha"; # latte, frappe, macchiato, mocha
    accent =
      "sky"; # rosewater, flamingo, pink, mauve, red, maroon, peach, yellow, green, teal, sky, sapphire, blue, lavender
    alacritty.enable = true;
    hyprland.enable = true;
    wlogout.enable = true;
    swaync.enable = true;
    # waybar.enable = true;
    cursors.enable = true;
    fish.enable = true;
    lsd.enable = true;
    fzf.enable = true;
    starship.enable = true;
    sioyek.enable = true;
    cache.enable = true;
    bat.enable = true;
  };
  # nix = {
  #    package = pkgs.nix;
  #   settings = { 
  #     experimental-features = [ "nix-command" "flakes" ];
  #     connect-timeout = 30; # Increase connection timeout to 30 seconds
  #      stalled-download-timeout = 60; # Increase stalled download timeout to 60 seconds
  #   };
  #   };
}
