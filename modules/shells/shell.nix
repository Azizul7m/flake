{ pkgs, config, ... }: {
  programs = {
    fish.enable = true;
    nushell.enable = true;
  };
  home = with pkgs; {
    packages = ([

      # For building dependencies
      pkg-config
      openssl
      clang
      glibc
      glibc.static

      ### SYSTEM LIBRARIES ###
      libepoxy # OpenGL function manager
      libxkbcommon # Keyboard handling
      libdecor # Wayland client decorations

      ### PROGRAMMING LANGUAGES ###
      # JavaScript/TypeScript
      nodejs
      nodePackages_latest.typescript-language-server

      # go
      go # The Go compiler and tools
      delve # Go debugger (optional)
      gopls # Go LSP server (optional)

      # Python
      python3
      python3Packages.pip
      poetry # Package management
      pyright # Static type checker

      # Rust
      rustup
      trunk # WASM bundler

      # (Web3)

      ### NIX ECOSYSTEM ###
      devbox # Dev environments
      direnv # Environment switcher
      nix-direnv # Nix integration
      nixfmt-classic # Formatter
      nixd # Language server
      nixdoc # Documentation

      ### SECURITY TOOLS ###
      # burpsuite # Web security testing
      # metasploit # Penetration framework
      # nikto # Web scanner
      # ghostscript # PDF processor (security research)
      # hey # test webserver

      ### PRODUCTIVITY TOOLS ###
      # CLI Utilities
      yt-dlp # Media downloader
      asciinema # Terminal recorder
      ragenix

      # Text Processing
      hunspell # Spell checker
      hunspellDicts.en_US
      shfmt # Shell formatter
      typioca # Typing test

      ### Lua
      lua-language-server # Language server
      stylua # Formatter

      ### LANGUAGE SERVERS (LSPs) ###
      yaml-language-server
      nginx-language-server
      prettier
      sqls # SQL
      #texlab # LaTeX
      tailwindcss-language-server
      vscode-langservers-extracted
      superhtml

      jellyfin-ffmpeg # Media support

      ### AI/ML TOOLS ###
      gemini-cli
      n8n # Workflow automation
    ]);
    sessionVariables = {
      OPENSSL_DIR = "${pkgs.openssl.dev}";
      OPENSSL_LIB_DIR = "${pkgs.openssl.out}/lib";
      OPENSSL_INCLUDE_DIR = "${pkgs.openssl.dev}/include";
    };
  };
}
