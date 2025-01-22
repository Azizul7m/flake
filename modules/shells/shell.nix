{ var, ... }: {
  programs = { fish.enable = true; };
  home = with var.pkgs; {
    packages = ([
      # C STUFF
      libtool
      libclang
      gnumake
      cmake
      gnupg
      gcc
      openssl
      pkg-config
      systemd # Some core packages are bundle with systemd

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
      devbox
      direnv
      nix-direnv
      nixfmt-classic
      nixd
      nixdoc
      nix-prefetch-github
      nix-prefetch-git

      # Rust
      trunk
      cargo-leptos
      leptosfmt
      rustup
      cargo-watch

      # Web3
      solc

      #anchor
      solana-validator

      # DEVOPS
      dockfmt # docker format
      docker-compose

      #utils
      starship
      eza # ls alternative
      grc # text colored
      hunspell
      typioca
      gping # Ping
      genact # feel like all you do in the terminal

      #LSP
      docker-ls
      docker-compose-language-service
      yaml-language-server
      nodePackages_latest.typescript-language-server
      bash-language-server
      vscode-langservers-extracted
      yaml-language-server
      tailwindcss-language-server
      nginx-language-server
      superhtml

      yt-dlp
      jellyfin-ffmpeg
    ]);
    sessionVariables = {
      LIBCLANG_PATH = "${libclang.lib}/lib";
      PKG_CONFIG_PATH = "${openssl.out}/lib/pkgconfig";
    };
  };
}
