{ config, pkgs, user, userEmail, ... }: {
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
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "23.05"; # Please read the comment before changing.
  home.packages = [ ];

  home.file = {
    # # Bulding this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

  };
  home.sessionPath = [
    "${config.home.homeDirectory}/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin"
  ];
  home.sessionVariables = {
    TERMINAL = "alacritty";
    VISUAL = "nvim";
    BROWSER = "google-chrome-stable";
    ANCHOR_HOME = "$HOME/.anchor";
    NIXPKGS_ALLOW_UNFREE = "1";
    NIXPKGS_ALLOW_INSECURE = "1";
    FLAKE = "~/flake";
    # Critical development environment variables
    LIBCLANG_PATH = "${pkgs.libclang.lib}/lib"; # Rust bindings
    PKG_CONFIG_PATH = "${pkgs.openssl.out}/lib/pkgconfig"; # Library discovery
    CC = "clang";
    CXX = "clang++";
    RUSTFLAGS = "-C linker=clang -C link-arg=-fuse-ld=lld";
  };

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "${user}";
      userEmail = "${userEmail}";
      diff-highlight.enable = true;
    };
  };
  nix = {
    package = pkgs.nix;
    settings = { experimental-features = [ "nix-command" "flakes" ]; };
  };
}
