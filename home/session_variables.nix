{config, pkgs, ...}: {
    home = {
    sessionPath = [
      "$HOME/.npm_global/bin"
      "$HOME/go/bin"
      "$HOME/.deno/bin"
      "$HOME/.cargo/bin"
      "$HOME/.bun/bin"
      "$HOME/.avm/bin"
      "$HOME/.config/emacs/bin"
      "$HOME/.local/bin"
      "$HOME/.local/share/nvim/mason/bin"
      "$HOME/.local/share/solana/install/active_release/bin"
    ];
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
      PASSWORD_STORE_DIR = "${config.home.homeDirectory}/.password-store";
    };
  };
}
