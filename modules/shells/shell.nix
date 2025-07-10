{ pkgs, ... }: {
  # Enable fish shell
  programs = { fish.enable = true; };
  home = with pkgs; {
    packages = ([

      ### SYSTEM LIBRARIES ###
      libepoxy # OpenGL function manager
      libxkbcommon # Keyboard handling
      libdecor # Wayland client decorations

      ### PROGRAMMING LANGUAGES ###
      # JavaScript/TypeScript
      nodejs
      nodePackages_latest.typescript-language-server

      # Python
      python3Full
      poetry # Package management
      pyright # Static type checker
      jython # Python for JVM

      # Rust
      rustup # Toolchain manager
      trunk # WASM bundler
      leptosfmt # Leptos formatter

      # Solidity (Web3)
      solc # Solidity compiler
      solana-cli # Solana CLI

      ### NIX ECOSYSTEM ###
      devbox # Dev environments
      direnv # Environment switcher
      nix-direnv # Nix integration
      nixfmt-classic # Formatter
      nixd # Language server
      nixdoc # Documentation
      nix-prefetch-github
      nix-prefetch-git

      ### MOBILE DEVELOPMENT ###
      android-tools # ADB/fastboot
      adb-sync # File sync
      adbfs-rootless # FUSE filesystem

      ### DEVOPS & CONTAINERS ###
      docker-compose
      dockfmt # Dockerfile formatter
      docker-ls # Language server
      docker-compose-language-service

      ### SECURITY TOOLS ###
      burpsuite # Web security testing
      metasploit # Penetration framework
      nikto # Web scanner
      ghostscript # PDF processor (security research)
      hey # test webserver

      ### PRODUCTIVITY TOOLS ###
      # Shell Enhancements
      starship # Prompt
      fish # Friendly shell

      # CLI Utilities
      lsd # Better ls
      grc # Output colorizer
      yt-dlp # Media downloader
      asciinema # Terminal recorder
      imgurbash2 # Image uploader

      # Text Processing
      hunspell # Spell checker
      hunspellDicts.en_US
      shfmt # Shell formatter
      typioca # Typing test

      ### LANGUAGE SERVERS (LSPs) ###
      nil # nix
      copilot-language-server
      bash-language-server
      yaml-language-server
      nginx-language-server
      superhtml # HTML
      sqls # SQL
      texlab # LaTeX
      tailwindcss-language-server
      vscode-langservers-extracted
      jellyfin-ffmpeg # Media support

      ### AI/ML TOOLS ###
      n8n # Workflow automation
    ]);

    # Critical development environment variables
    sessionVariables = {
      LIBCLANG_PATH = "${libclang.lib}/lib"; # Rust bindings
      PKG_CONFIG_PATH = "${openssl.out}/lib/pkgconfig"; # Library discovery
      CC = "clang";
      CXX = "clang++";
      RUSTFLAGS = "-C linker=clang -C link-arg=-fuse-ld=lld";
    };
  };
}
