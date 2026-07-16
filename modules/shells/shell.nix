{ pkgs, ... }:
{
  programs = {
    fish.enable = true;
    nushell.enable = true;
  };
  home = with pkgs; {
    packages = ([
      # For building dependencies
      zlib # Compression library
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
      typescript-language-server

      # go
      go # The Go compiler and tools
      delve # Go debugger (optional)
      gopls # Go LSP server (optional)
      templ # Go templ language support

      # Python
      python3
      # poetry # Package management
      pyright # Static type checker
      python313Packages.pip
      pipx
      # Rust
      #      rustup
      # rustc
      # cargo
      # rust-analyzer
      trunk # WASM bundler

      # (Web3)

      ### NIX ECOSYSTEM ###
      direnv # Environment switcher
      nix-direnv # Nix integration
      devbox # Dev environments
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
      yazi

      # Text Processing
      hunspell # Spell checker
      hunspellDicts.en_US
      shfmt # Shell formatter
      typioca # Typing test

      ### Lua
      lua-language-server # Language server
      stylua # Formatter
      # ltex-ls

      ### LANGUAGE SERVERS (LSPs) ###
      bash-language-server
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
      # n8n # Workflow automation
    ]);
    sessionVariables = {
      OPENSSL_DIR = "${pkgs.openssl.dev}";
      OPENSSL_LIB_DIR = "${pkgs.openssl.out}/lib";
      OPENSSL_INCLUDE_DIR = "${pkgs.openssl.dev}/include";
    };
  };
}
