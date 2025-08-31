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

  age = {
    identityPaths = ["${config.home.homeDirectory}/.ssh/id_ed25519"];
    secrets = {
      openai = {
         file = ../secrets/openai.age;
      };
      groq = {
         file = ../secrets/groq.age;
      };
      gemini = {
        file = ../secrets/gemini.age;
      };
    };
  };


  home = {
      username = "${user}";
      homeDirectory = "/home/${user}";
      stateVersion = "23.05"; # Please read the comment before changing.
      packages = [ ];
      sessionPath = [
         "${config.home.homeDirectory}/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin"
     ];
    sessionVariables = {
      MANPAGER = "less right";
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
      # Api environment variables
      OPENAI_API_KEY_FILE = "$(cat ${config.age.secrets.openai.file})";
      GORGON_API_KEY_FILE = "$(cat ${config.age.secrets.groq.file})";
      GEMINI_API_KEY_FILE = "$(cat ${config.age.secrets.gemini.file})";
    };
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
  catppuccin = {
    flavor = "mocha"; # latte, frappe, macchiato, mocha
    accent = "rosewater"; # rosewater, flamingo, pink, mauve, red, maroon, peach, yellow, green, teal, sky, sapphire, blue, lavender
      alacritty.enable = true;
      hyprland.enable = true;
      wlogout.enable = true;
      rofi.enable = true;
      swaync.enable = true;
      waybar.enable = true;
      cursors.enable = true;
      fish.enable = true;
      lsd.enable = true;
      fzf.enable = true;
      starship.enable = true;
      sioyek.enable = true;
      fcitx5.enable = true;
      cache.enable = true;
      bat.enable = true;
  };
  nix = {
    package = pkgs.nix;
    settings = { experimental-features = [ "nix-command" "flakes" ]; };
  };
}
