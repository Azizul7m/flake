{ var, ... }: {
  imports = [ ./react_native.nix ];
  programs = { fish.enable = true; };
  home = with var.pkgs; {
    packages = ([
      # Build essential
      stdenv
      subversion
      cmake
      libepoxy
      wayland-protocols
      libxkbcommon
      libdecor
      libtool
      libclang
      gnumake
      cmake
      gnupg
      gcc
      openssl
      pkg-config
      systemd # Some core packages are bundle with systemd

      #AI

      #android
      android-tools
      adb-sync
      adbfs-rootless

      #JS
      nodejs

      #PY
      python3Full
      poetry
      pyright
      jython # python interpreter for java

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
      leptosfmt
      rustup

      # Web3
      solc

      #anchor
      solana-cli

      # DEVOPS
      dockfmt # docker format
      docker-compose

      #utils
      starship
      lsd # ls alternative
      grc # text colored
      hunspell
      typioca
      asciinema # Record terminal
      imgurbash2
      shell-gpt
      hunspell
      hunspellDicts.en_US

      # Bypass
      gping # Ping
      httpie # https cleint for *GET,POST,PUT*
      metasploit
      nikto
      burpsuite
      proxychains-ng
      ghostscript

      #LSP
      bash-language-server
      docker-ls
      docker-compose-language-service
      jellyfin-ffmpeg
      yaml-language-server
      nodePackages_latest.typescript-language-server
      nginx-language-server
      superhtml
      sqls
      texlab # LaTex
      tailwindcss-language-server
      vscode-langservers-extracted
      yaml-language-server
      yt-dlp
    ]);
    sessionVariables = {
      LIBCLANG_PATH = "${libclang.lib}/lib";
      PKG_CONFIG_PATH = "${openssl.out}/lib/pkgconfig";
    };
  };
}
