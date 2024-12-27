{ var, ... }: {
  programs = { bun.enable = true; };
  home = {
    packages = (with var.pkgs; [
      # C STUFF
      libtool
      libclang
      gnumake
      cmake
      gnupg
      gcc
      pkg-config
      systemd # Some core packages are bundle with systemd
      openssl

      android-tools
      adb-sync
      adbfs-rootless

      #JS
      deno
      nodejs

      #PY
      python310
      python310Packages.pip
      pipenv

      # BASH
      shfmt

      # NIX
      nixfmt-classic
      nixd
      nixdoc

      # Rust
      rustup
      cargo-watch

      # Web3
      solc

      #anchor
      solana-validator

      # DEVOPS
      devbox
      direnv
      dockfmt # docker format
      docker-compose
      emacs-lsp-booster

      #utils
      starship
      eza # ls alternative
      grc # text colored
      hunspell
      typioca

      #LSP
      docker-ls
      docker-compose-language-service
      yaml-language-server
      nodePackages_latest.typescript-language-server

      yt-dlp
      jellyfin-ffmpeg
    ]) ++ (with var.pkgs-stable;
      [
        # rnix-lsp 
      ]);
    sessionVariables = { LIBCLANG_PATH = "${var.pkgs.libclang.lib}/lib"; };
  };
}
